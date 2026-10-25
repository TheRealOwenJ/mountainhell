extends RichTextLabel

func click(meta):
	OS.shell_open(str(meta))
