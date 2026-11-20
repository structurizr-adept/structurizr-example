workspace.model.elements.each { element ->
    def id = element.getProperties().get("structurizr.dsl.identifier")

    if (id == null || id.toLowerCase().endsWith("consumer")) {
        return
    }

    boolean hasKafkaTopicRelationship = element.getRelationships().any { rel ->
        def dest = rel.getDestination()
        dest.getTags().contains("Kafka") && dest.getTags().contains("Topic")
    }
    if (hasKafkaTopicRelationship) {
        element.addTags("Producer")
    }
}
