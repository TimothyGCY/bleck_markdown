# bleck_markdown
> A Markdown previewer for Flutter project.
>> Built with [markdown], [flutter_html], [flutter_highlight]

## Getting started
### Installation
```yaml
# pubspec.yaml
dependencies:
	bleck_markdown:
		git:
			url: https://github.com/TimothyGCY/bleck_markdown.git
```

## Usage
```dart
import 'package:bleck_markdown/bleck_markdown';

String data = '''# This is H1
## This is H2
`inline code`''';

// ...

@override
Widget build(BuildContext context) {
	return MarkdownPreview(data: data);
}
```

[markdown]: https://pub.dev/packages/markdown
[flutter_html]: https://pub.dev/packages/flutter_html
[flutter_highlight]: https://pub.dev/packages/flutter_highlight
