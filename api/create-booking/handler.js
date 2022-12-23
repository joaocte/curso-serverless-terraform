const AWS = require('aws-sdk')
const { v4: uuid4 } = require('uuid')
AWS.config.update({
    region: process.env.AWS_REGION
})

const documentClient = new AWS.DynamoDB.DocumentClient()
module.exports.create = async event => {

    const body = JSON.parse(event.body)

    await documentClient.put({
        TableName: process.env.DYNAMODB_BOOKINGS,
        Item: {
            id: uuid4(),
            date: body.date,
            user_id: event.requestContext.authorizer.id,
            user: event.requestContext.authorizer
        }
    }).promise()

    return {
        statusCode: 201,
        body: JSON.stringify({message: 'Agendamento Realizado com Sucesso!'})
    }
}