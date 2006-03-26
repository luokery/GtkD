/*
 * This file is part of duit.
 *
 * duit is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * duit is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with duit; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * outPack = gtk
 * outFile = FontButton
 * strct   = GtkFontButton
 * realStrct=
 * clss    = FontButton
 * interf  = 
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- gtk_font_button_
 * 	- gtk_
 * omit structs:
 * omit prefixes:
 * omit code:
 * imports:
 * 	- glib.Str
 * structWrap:
 * local aliases:
 */

module gtk.FontButton;

private import gtk.typedefs;

private import lib.gtk;

private import glib.Str;

/**
 * Description
 * The GtkFontButton is a button which displays the currently selected font an allows to open a font selection
 * dialog to change the font. It is suitable widget for selecting a font in a preference dialog.
 */
private import gtk.Button;
public class FontButton : Button
{
	
	/** the main Gtk struct */
	protected GtkFontButton* gtkFontButton;
	
	
	public GtkFontButton* getFontButtonStruct()
	{
		return gtkFontButton;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gtkFontButton;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GtkFontButton* gtkFontButton)
	{
		super(cast(GtkButton*)gtkFontButton);
		this.gtkFontButton = gtkFontButton;
	}
	
	/**
	 */
	
	// imports for the signal processing
	private import gobject.Signals;
	private import gdk.typedefs;
	int[char[]] connectedSignals;
	
	void delegate(FontButton)[] onFontSetListeners;
	void addOnFontSet(void delegate(FontButton) dlg)
	{
		if ( !("font-set" in connectedSignals) )
		{
			Signals.connectData(
			getStruct(),
			"font-set",
			cast(GCallback)&callBackFontSet,
			this,
			null,
			GConnectFlags.AFTER);
			connectedSignals["font-set"] = 1;
		}
		onFontSetListeners ~= dlg;
	}
	extern(C) static void callBackFontSet(GtkFontButton* widgetStruct, FontButton fontButton)
	{
		bit consumed = false;
		
		foreach ( void delegate(FontButton) dlg ; fontButton.onFontSetListeners )
		{
			dlg(fontButton);
		}
		
		return consumed;
	}
	
	
	
	/**
	 * Creates a new font picker widget.
	 * Returns:
	 *  a new font picker widget.
	 * Since 2.4
	 */
	public this ()
	{
		// GtkWidget* gtk_font_button_new (void);
		this(cast(GtkFontButton*)gtk_font_button_new() );
	}
	
	/**
	 * Creates a new font picker widget.
	 * fontname:
	 *  Name of font to display in font selection dialog
	 * Returns:
	 *  a new font picker widget.
	 * Since 2.4
	 */
	public this (char[] fontname)
	{
		// GtkWidget* gtk_font_button_new_with_font (const gchar *fontname);
		this(cast(GtkFontButton*)gtk_font_button_new_with_font(Str.toStringz(fontname)) );
	}
	
	/**
	 * Sets or updates the currently-displayed font in font picker dialog.
	 * font_button:
	 *  a GtkFontButton
	 * fontname:
	 *  Name of font to display in font selection dialog
	 * Returns:
	 *  Return value of gtk_font_selection_dialog_set_font_name() if the
	 * font selection dialog exists, otherwise FALSE.
	 * Since 2.4
	 */
	public int setFontName(char[] fontname)
	{
		// gboolean gtk_font_button_set_font_name (GtkFontButton *font_button,  const gchar *fontname);
		return gtk_font_button_set_font_name(gtkFontButton, Str.toStringz(fontname));
	}
	
	/**
	 * Retrieves the name of the currently selected font.
	 * font_button:
	 *  a GtkFontButton
	 * Returns:
	 *  an internal copy of the font name which must not be freed.
	 * Since 2.4
	 */
	public char[] getFontName()
	{
		// const gchar* gtk_font_button_get_font_name (GtkFontButton *font_button);
		return Str.toString(gtk_font_button_get_font_name(gtkFontButton) );
	}
	
	/**
	 * If show_style is TRUE, the font style will be displayed along with name of the selected font.
	 * font_button:
	 *  a GtkFontButton
	 * show_style:
	 *  TRUE if font style should be displayed in label.
	 * Since 2.4
	 */
	public void setShowStyle(int showStyle)
	{
		// void gtk_font_button_set_show_style (GtkFontButton *font_button,  gboolean show_style);
		gtk_font_button_set_show_style(gtkFontButton, showStyle);
	}
	
	/**
	 * Returns whether the name of the font style will be shown in the label.
	 * font_button:
	 *  a GtkFontButton
	 * Returns:
	 *  whether the font style will be shown in the label.
	 * Since 2.4
	 */
	public int getShowStyle()
	{
		// gboolean gtk_font_button_get_show_style (GtkFontButton *font_button);
		return gtk_font_button_get_show_style(gtkFontButton);
	}
	
	/**
	 * If show_size is TRUE, the font size will be displayed along with the name of the selected font.
	 * font_button:
	 *  a GtkFontButton
	 * show_size:
	 *  TRUE if font size should be displayed in dialog.
	 * Since 2.4
	 */
	public void setShowSize(int showSize)
	{
		// void gtk_font_button_set_show_size (GtkFontButton *font_button,  gboolean show_size);
		gtk_font_button_set_show_size(gtkFontButton, showSize);
	}
	
	/**
	 * Returns whether the font size will be shown in the label.
	 * font_button:
	 *  a GtkFontButton
	 * Returns:
	 *  whether the font size will be shown in the label.
	 * Since 2.4
	 */
	public int getShowSize()
	{
		// gboolean gtk_font_button_get_show_size (GtkFontButton *font_button);
		return gtk_font_button_get_show_size(gtkFontButton);
	}
	
	/**
	 * If use_font is TRUE, the font name will be written using the selected font.
	 * font_button:
	 *  a GtkFontButton
	 * use_font:
	 *  If TRUE, font name will be written using font chosen.
	 * Since 2.4
	 */
	public void setUseFont(int useFont)
	{
		// void gtk_font_button_set_use_font (GtkFontButton *font_button,  gboolean use_font);
		gtk_font_button_set_use_font(gtkFontButton, useFont);
	}
	
	/**
	 * Returns whether the selected font is used in the label.
	 * font_button:
	 *  a GtkFontButton
	 * Returns:
	 *  whether the selected font is used in the label.
	 * Since 2.4
	 */
	public int getUseFont()
	{
		// gboolean gtk_font_button_get_use_font (GtkFontButton *font_button);
		return gtk_font_button_get_use_font(gtkFontButton);
	}
	
	/**
	 * If use_size is TRUE, the font name will be written using the selected size.
	 * font_button:
	 *  a GtkFontButton
	 * use_size:
	 *  If TRUE, font name will be written using the selected size.
	 * Since 2.4
	 */
	public void setUseSize(int useSize)
	{
		// void gtk_font_button_set_use_size (GtkFontButton *font_button,  gboolean use_size);
		gtk_font_button_set_use_size(gtkFontButton, useSize);
	}
	
	/**
	 * Returns whether the selected size is used in the label.
	 * font_button:
	 *  a GtkFontButton
	 * Returns:
	 *  whether the selected size is used in the label.
	 * Since 2.4
	 */
	public int getUseSize()
	{
		// gboolean gtk_font_button_get_use_size (GtkFontButton *font_button);
		return gtk_font_button_get_use_size(gtkFontButton);
	}
	
	/**
	 * Sets the title for the font selection dialog.
	 * font_button:
	 *  a GtkFontButton
	 * title:
	 *  a string containing the font selection dialog title
	 * Since 2.4
	 */
	public void setTitle(char[] title)
	{
		// void gtk_font_button_set_title (GtkFontButton *font_button,  const gchar *title);
		gtk_font_button_set_title(gtkFontButton, Str.toStringz(title));
	}
	
	/**
	 * Retrieves the title of the font selection dialog.
	 * font_button:
	 *  a GtkFontButton
	 * Returns:
	 *  an internal copy of the title string which must not be freed.
	 * Since 2.4
	 * Property Details
	 * The "font-name" property
	 *  "font-name" gchararray : Read / Write
	 * The name of the currently selected font.
	 * Default value: "Sans 12"
	 * Since 2.4
	 */
	public char[] getTitle()
	{
		// const gchar* gtk_font_button_get_title (GtkFontButton *font_button);
		return Str.toString(gtk_font_button_get_title(gtkFontButton) );
	}
	
	
	
	
	
}
