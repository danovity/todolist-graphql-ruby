Types::QueryType =
  GraphQL::ObjectType.define do
    name 'Query'

    fields GraphQLUtils::FieldCombiner.combine(
      [
        TypesTask::Queries::TaskQueryType,
        TypesSubtask::Queries::SubtaskQueryType
      ]
    )
  end
