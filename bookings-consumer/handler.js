'use strict';

const AWS = require('aws-sdk')

const converter = AWS.DynamoDB.Converter
const moment = require('moment')
moment.locale('pt-br')
module.exports.listen = async (event) => {
  for(const record of event.Records )
  {
    if(record.eventName == 'INSERT')
    {
      const reserva = converter.unmarshall(record.dynamodb.NewImage)
      console.log(`Reserva efetuada: O usuário: ${reserva.user.name} (${reserva.user.email}) agendou um horário em: ${moment(reserva.date).format('LLLL')}`)

    }
  }

  return event;
};
