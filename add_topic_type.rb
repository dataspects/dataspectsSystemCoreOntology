# DSKMFCoreOntology$ REPOSITORY= NAME= DOMAIN= ruby add_type.rb

name = ENV['NAME']
extension = 'sRawContent'
domain = ENV['DOMAIN']
repository = ENV['REPOSITORY']

files = {}

files[name] = "{{ComponentType2
|HasKeyword=
}}[[Category:#{domain}Ontology]]"

files["Template:#{name}"] = "<includeonly>{{METADATA|Keywords={{{HasKeyword|}}}|HasTitle={{{HasTitle}}}}}

{{RegularProperty|PropertyName=HasSubjectType|PropertyValue=#{name}}}

{{DISPLAYTITLE:#{name} \"{{{HasTitle}}}\"}}
{{#default_form:#{name}}}</includeonly>
+<includeonly>[[Category:Subject]]</includeonly>
<noinclude>[[Category:#{domain}Ontology]]</noinclude>"

files["Form:#{name}"] = "{{{info|add title=Add #{name}|edit title=Edit #{name}|page name=C<unique number;random;10>}}}

{{FormHeader|#{name}}}

{{StandardFormSections}}

{{FormFooter|#{name}}}

[[Category:#{domain}Ontology]]"

files.each do |name, content|
  open("#{repository}/objects/#{name}.#{extension}", 'w') do |f|
    f.puts content
  end
end
