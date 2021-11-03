module Mutations
  class AttachFiles < BaseMutation
    # argument :input, Types::AttachFilesAttributes, required: true
    argument :related_id, Int, required: true
    argument :related_type, String, required: true
    argument :field, String, required: true
    argument :signed_ids, [String], required: true
    
    type Boolean
  
    def resolve(input)
      related_id, related_type, field, signed_ids = input.values_at(:related_id, :related_type, :field, :signed_ids)
      # TODO: can? update
      related_type.constantize.find(related_id).update(field => signed_ids)
    end
  end
end