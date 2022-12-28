'use strict';

const AWS = require('aws-sdk')
AWS.config.update({
  region: process.env.AWS_REGION
})
const converter = AWS.DynamoDB.Converter
const moment = require('moment')
const SNS = new AWS.SNS
moment.locale('pt-br')
module.exports.listen = async (event) => {
  const snsPromises = []
  for(const record of event.Records )
  {
    if(record.eventName == 'INSERT')
    {
      const reserva = converter.unmarshall(record.dynamodb.NewImage)
      snsPromises.push(
        SNS.publish({
          TopicArn: process.env.SNS_NOTIFICATIONS_TOPIC,
          Message: `Reserva efetuada: O usuário: ${reserva.user.name} (${reserva.user.email}) agendou um horário em: ${moment(reserva.date).format('LLLL')}` 
        }).promise
      )
    }
  }
  await Promise.all(snsPromises)
  console.log('Mensagem(ns) enviada(s) com sucesso!')
  return event;
};
