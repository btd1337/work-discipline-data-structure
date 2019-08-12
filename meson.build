project('trabalho_ed2', ['vala', 'c'],
        version: '0.1.0',
  meson_version: '>= 0.40.0',
)

subdir('src')

executable(
	meson.project_name(),
	'src/ClassroomManager.vala',
	'src/FileTypes.vala',
	'src/Main.vala',
	'src/enums/FileTypes.vala',
	'src/models/Student.vala',
	'src/utils/CSVHandler.vala',
	dependencies: [
		dependency('glib-2.0'),
		dependency('gio-2.0')
	],
	install: false
)

