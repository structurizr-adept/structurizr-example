workspace.model.elements.each { element ->
    def id = element.getProperties().get("structurizr.dsl.identifier")

    if (id != null && id.toLowerCase().endsWith("consumer")) {
        element.addTags("Consumer")
    }
}
