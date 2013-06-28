/*
----------------------------------------------------------------------------------------------------------------------
::
::    Description: This MaxScript is for changing multiple colors and textures and render all in batch
::
----------------------------------------------------------------------------------------------------------------------
:: LICENSE ----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
::
::    Copyright (C) 2013 Jonathan Baecker (jb_alvarado)
::
::    This program is free software: you can redistribute it and/or modify
::    it under the terms of the GNU General Public License as published by
::    the Free Software Foundation, either version 3 of the License, or
::    (at your option) any later version.
::
::    This program is distributed in the hope that it will be useful,
::    but WITHOUT ANY WARRANTY; without even the implied warranty of
::    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
::    GNU General Public License for more details.
::
::    You should have received a copy of the GNU General Public License
::    along with this program.  If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------
:: History --------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
::
:: This is version 0.5 from 2013-06-21. Last bigger modification was on 2013-06-27
:: 
----------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------
--
--  Script Name: Multi Change Color Texture And Render
--
--	Author:   Jonathan Baecker (jb_alvardo), www.pixelcrusher.de | blog.pixelcrusher.de
--
----------------------------------------------------------------------------------------------------------------------
*/

(
global colMats = #()
global colMatsLi = #()
	
	fn matlists mtl = (
		case classof mtl of (
			--------------------------------------------------
			--Blend
			--------------------------------------------------
			Blend:
			(
				li=dotNetObject "System.Windows.Forms.ListViewItem" mtl.name
				cli = ((colorman.getColor #background)*255+10) as color
				li.backColor=li.backColor.fromARGB cli.r cli.g cli.b
				append colMatsLi li
				join colMats #(mtl)
				
				if (mtl.map1 != undefined) do (
					li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl.map1.name)
					cls = ((colorman.getColor #background)*255+20) as color
					li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
					append colMatsLi li
					join colMats #(mtl.map1)
					)
				if (mtl.map2 != undefined) do (
					li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl.map2.name)
					cls = ((colorman.getColor #background)*255+20) as color
					li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
					append colMatsLi li
					join colMats #(mtl.map2)
					)
			)
			--------------------------------------------------
			--Shellac
			--------------------------------------------------
			Shellac:
			(
				li=dotNetObject "System.Windows.Forms.ListViewItem" mtl.name
				cli = ((colorman.getColor #background)*255+10) as color
				li.backColor=li.backColor.fromARGB cli.r cli.g cli.b
				append colMatsLi li
				join colMats #(mtl)

				if (mtl.shellacMtl1 != undefined) do (
					li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl.shellacMtl1.name)
					cls = ((colorman.getColor #background)*255+20) as color
					li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
					append colMatsLi li
					join colMats #(mtl.shellacMtl1)
					)
				if (mtl.shellacMtl2 != undefined) do (
					li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl.shellacMtl2.name)
					cls = ((colorman.getColor #background)*255+20) as color
					li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
					append colMatsLi li
					join colMats #(mtl.shellacMtl2)
					)
			)
			--------------------------------------------------
			--TopBottom 
			--------------------------------------------------
			TopBottom:
			(
				li=dotNetObject "System.Windows.Forms.ListViewItem" mtl.name
				cli = ((colorman.getColor #background)*255+10) as color
				li.backColor=li.backColor.fromARGB cli.r cli.g cli.b
				append colMatsLi li
				join colMats #(mtl)

				if (mtl.topMaterial != undefined) do (
					li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl.topMaterial.name)
					cls = ((colorman.getColor #background)*255+20) as color
					li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
					append colMatsLi li
					join colMats #(mtl.topMaterial)
					)
				if (mtl.bottomMaterial != undefined) do (
					li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl.bottomMaterial.name)
					cls = ((colorman.getColor #background)*255+20) as color
					li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
					append colMatsLi li
					join colMats #(mtl.bottomMaterial)
					)
			)
			--------------------------------------------------
			--DoubleSided 
			--------------------------------------------------
			doubleSided:
			(
				li=dotNetObject "System.Windows.Forms.ListViewItem" mtl.name
				cli = ((colorman.getColor #background)*255+10) as color
				li.backColor=li.backColor.fromARGB cli.r cli.g cli.b
				append colMatsLi li
				join colMats #(mtl)

				if (mtl.material1 != undefined) do (
					li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl.material1.name)
					cls = ((colorman.getColor #background)*255+20) as color
					li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
					append colMatsLi li
					join colMats #(mtl.material1)
					)
				if (mtl.material2 != undefined) do (
					li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl.material2.name)
					cls = ((colorman.getColor #background)*255+20) as color
					li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
					append colMatsLi li
					join colMats #(mtl.material2)
					)
			)
			--------------------------------------------------
			--Shell_Material 
			--------------------------------------------------
			Shell_Material:
			(
				li=dotNetObject "System.Windows.Forms.ListViewItem" mtl.name
				cli = ((colorman.getColor #background)*255+10) as color
				li.backColor=li.backColor.fromARGB cli.r cli.g cli.b
				append colMatsLi li
				join colMats  #(mtl)

				if (mtl.originalMaterial != undefined) do (
					li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl.originalMaterial.name)
					cls = ((colorman.getColor #background)*255+20) as color
					li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
					append colMatsLi li
					join colMats #(mtl.originalMaterial)
					)
				if (mtl.bakedMaterial != undefined) do (
					li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl.bakedMaterial.name)
					cls = ((colorman.getColor #background)*255+20) as color
					li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
					append colMatsLi li
					join colMats #(mtl.bakedMaterial)
					)
			)
			--------------------------------------------------
			-- Multimaterials
			--------------------------------------------------
			MultiMaterial:
			(
				li=dotNetObject "System.Windows.Forms.ListViewItem" mtl.name
				cli = ((colorman.getColor #background)*255+10) as color
				li.backColor=li.backColor.fromARGB cli.r cli.g cli.b
				append colMatsLi li
				join colMats  #(mtl)

				local m
				for m = 1 to mtl.numsubs do
				(
					if (mtl[m] != undefined) do (
						li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl[m].name)
						cls = ((colorman.getColor #background)*255+20) as color
						li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
						append colMatsLi li
						join colMats #(mtl[m])
						)
				)
		 	)
			--------------------------------------------------
			--CompositeMaterial
			--------------------------------------------------
			CompositeMaterial:
			(
				li=dotNetObject "System.Windows.Forms.ListViewItem" mtl.name
				cli = ((colorman.getColor #background)*255+10) as color
				li.backColor=li.backColor.fromARGB cli.r cli.g cli.b
				append colMatsLi li
				join colMats  #(mtl)

				local c
				for c = 1 to mtl.materialList.count do
				(
					if (mtl.materialList[c] != undefined) do (
						li=dotNetObject "System.Windows.Forms.ListViewItem" ("    " + mtl.materialList[c].name)
						cls = ((colorman.getColor #background)*255+20) as color
						li.backColor=li.backColor.fromARGB cls.r cls.g cls.b
						append colMatsLi li
						join colMats  #(mtl.materialList[c])
						)
				)
		 	)
			--------------------------------------------------
			--all other materials
			--------------------------------------------------
			default:
			(
				if (superclassof mtl == material) do (
					li=dotNetObject "System.Windows.Forms.ListViewItem" mtl.name
					cli = ((colorman.getColor #background)*255+10) as color
					li.backColor=li.backColor.fromARGB cli.r cli.g cli.b
					append colMatsLi li
					join colMats  #(mtl)
					)
			)
			
		) --case end
		
	) --fn matlists end	

	fn processColTex prMat prTex = (	
		case classof prMat of (
			Arch___Design__mi: (
				try (prMat.diff_color_map = Bitmaptexture fileName:prTex
					) catch (
						prMat.diff_color_map = undefined
						prMat.diff_color = prTex
						)	
				)
			StandardMaterial: (
				try (prMat.diffuseMap = Bitmaptexture fileName:prTex
					) catch (
						prMat.diffuseMap = undefined
						prMat.Diffuse = prTex
						prMat.ambient = prTex
						)	
				)	
			Car_Paint_Material__mi: (
				try (prMat.base_color.shader = Bitmaptexture fileName:prTex
					) catch (
						prMat.base_color.shader = undefined
						prMat.base_color.paramName = ""
						prMat.base_color = prTex
						)	
				)	
			Architectural: (
				try (prMat.diffuseMap = Bitmaptexture fileName:prTex
					) catch (
						prMat.diffuseMap = undefined
						prMat.Diffuse = prTex
						)	
				)
			)
		)	

rollout MultiChangeColorTextureAndRender "Multi Change Color Texture And Render" width:790 height:720 (
	
	local ProgramName = "Multi Change Color Texture And Render"
	local colPathLi1 = #()
	local colPathLi2 = #()
	local colPath1 = #()
	local colPath2 = #()
	local colListLi1 = #()
	local colListLi2 = #()
	local outFolder = undefined

	groupBox grpSeMyTex "Collection From All Materials:" pos:[10,10] width:770 height:220
		button btnSeMatAndTex "Collect Materials" pos:[20,30] width:100 height:20
		dotNetControl DotNBoxMats1 "system.windows.forms.listView" pos:[20,60] width:360 height:160
		dotNetControl DotNBoxMats2 "system.windows.forms.listView" pos:[410,60] width:360 height:160

	groupBox grpColTex "Colors and Textures 1:" pos:[10,230] width:380 height:400
		button btnClear1 "Clear List 1" pos:[320,245] width:60 height:18
		label texInfo "Path To Texture Folder 1:" pos:[20,250]
		editText texPath1 "" pos:[16,270] width:300 readOnly:true
		button btnChangeTex1 "Browse 1" pos:[320,270] width:60 height:18
		colorPicker colP "Color 1:" pos:[20,295] width:100 height:18 color:(color 100 255 100) modal:false

		button btnAddCol1 "Add Color1" pos:[320,295] width:60 height:18
		dotNetControl DotNBoxCT1 "system.windows.forms.listView" pos:[20,320] width:360 height:300
		
	groupBox grpColTex2 "Colors and Textures 2:" pos:[400,230] width:380 height:400
		button btnClear2 "Clear List 2" pos:[710,245] width:60 height:18
		label texInfo2 "Path To Texture Folder 2:" pos:[410,250]
		editText texPath2 "" pos:[406,270] width:300 readOnly:true
		button btnChangeTex2 "Browse 2" pos:[710,270] width:60 height:18
		colorPicker colP2 "Color 2:" pos:[410,295] width:100 height:18 color:(color 100 255 100) modal:false

		button btnAddCol2 "Add Color2" pos:[710,295] width:60 height:18
		dotNetControl DotNBoxCT2 "system.windows.forms.listView" pos:[410,320] width:360 height:300	

	groupBox grpRender "Render Output:" pos:[10,630] width:770 height:80
		editText RenderPath "" pos:[16,650] width:688 readOnly:true
		button btnOutput "Output" pos:[710,650] width:60 height:18
		checkBox chkMakeF "Create Sub Folders" pos:[20,678] checked:true
		dropDownList ddlType "" pos:[645,678] width:60 items:#(".bmp", ".cin", ".exr", ".pic", ".jpg", ".jpe", ".jpeg", ".png", ".rgb", ".rgba", ".sgi", ".int", ".rla", ".rpf", ".tga", ".tif") selection:8
		button btnRender "Render" pos:[710,675] width:60 height:24

	-----------------------------------------------
	--DotNet Listview
	-----------------------------------------------
	
	on MultiChangeColorTextureAndRender open do (
		cb = ((colorman.getColor #background)*255+20) as color
		cf = ((colorman.getColor #text)*255+30) as color
		
		DotNBoxMats1.columns.add "Material List 1" 339
		DotNBoxMats1.view=(dotNetClass "system.windows.forms.view").details
		DotNBoxMats1.FullRowSelect=true
		DotNBoxMats1.GridLines=false
		DotNBoxMats1.MultiSelect=false
		DotNBoxMats1.CheckBoxes=true
		DotNBoxMats1.BackColor = (dotNetClass "System.Drawing.Color").fromARGB cb.r cb.g cb.b
		DotNBoxMats1.ForeColor = (dotNetClass "System.Drawing.Color").fromARGB cf.r cf.g cf.b
		
		DotNBoxMats2.columns.add "Material List 2" 339
		DotNBoxMats2.view=(dotNetClass "system.windows.forms.view").details
		DotNBoxMats2.FullRowSelect=true
		DotNBoxMats2.GridLines=false
		DotNBoxMats2.MultiSelect=false
		DotNBoxMats2.CheckBoxes=true
		DotNBoxMats2.BackColor = (dotNetClass "System.Drawing.Color").fromARGB cb.r cb.g cb.b
		DotNBoxMats2.ForeColor = (dotNetClass "System.Drawing.Color").fromARGB cf.r cf.g cf.b
		
		DotNBoxCT1.columns.add "Colors and Textures 1" 339
		DotNBoxCT1.view=(dotNetClass "system.windows.forms.view").details
		DotNBoxCT1.FullRowSelect=true
		DotNBoxCT1.GridLines=false
		DotNBoxCT1.MultiSelect=false
		DotNBoxCT1.BackColor = (dotNetClass "System.Drawing.Color").fromARGB cb.r cb.g cb.b
		DotNBoxCT1.ForeColor = (dotNetClass "System.Drawing.Color").fromARGB cf.r cf.g cf.b
		
		DotNBoxCT2.columns.add "Colors and Textures 2" 339
		DotNBoxCT2.view=(dotNetClass "system.windows.forms.view").details
		DotNBoxCT2.FullRowSelect=true
		DotNBoxCT2.GridLines=false
		DotNBoxCT2.MultiSelect=false
		DotNBoxCT2.BackColor = (dotNetClass "System.Drawing.Color").fromARGB cb.r cb.g cb.b
		DotNBoxCT2.ForeColor = (dotNetClass "System.Drawing.Color").fromARGB cf.r cf.g cf.b
		)
	
	-----------------------------------------------
	--resize statment
	-----------------------------------------------
	on MultiChangeColorTextureAndRender resized newSize do (

		grpSeMyTex.width=newSize[1]-20
		grpSeMyTex.height=newSize[2]-500
			DotNBoxMats1.width=newSize[1]/2-35
			DotNBoxMats1.height=newSize[2]-560
			DotNBoxMats2.pos=[newSize[1]/2+15,60]
			DotNBoxMats2.width=newSize[1]/2-35
			DotNBoxMats2.height=newSize[2]-560
		
			try (DotNBoxMats1.columns.item[0].width = newSize[1]/2-56) catch ()
			try (DotNBoxMats2.columns.item[0].width = newSize[1]/2-56) catch ()
		
		grpColTex.pos=[10, newSize[2]-490]
		grpColTex.width=newSize[1]/2-15
			btnClear1.pos=[newSize[1]/2-75, newSize[2]-475]
			texInfo.pos=[20, newSize[2]-470]
			texPath1.pos=[20, newSize[2]-450]
			texPath1.width=newSize[1]/2-100
			btnChangeTex1.pos=[newSize[1]/2-75, newSize[2]-450]
			colP.pos=[63, newSize[2]-425]
			btnAddCol1.pos=[newSize[1]/2-75, newSize[2]-425]
			DotNBoxCT1.width=newSize[1]/2-35
			DotNBoxCT1.pos=[20, newSize[2]-400]
		
			try (DotNBoxCT1.columns.item[0].width = newSize[1]/2-56) catch ()
			
		grpColTex2.pos=[newSize[1]/2+5, newSize[2]-490]
		grpColTex2.width=newSize[1]/2-15
			btnClear2.pos=[newSize[1]-80, newSize[2]-475]
			texInfo2.pos=[newSize[1]/2+15, newSize[2]-470]
			texPath2.pos=[newSize[1]/2+15, newSize[2]-450]
			texPath2.width=newSize[1]/2-100
			btnChangeTex2.pos=[newSize[1]-80, newSize[2]-450]
			colP2.pos=[newSize[1]/2+57, newSize[2]-425]
			btnAddCol2.pos=[newSize[1]-80, newSize[2]-425]
			DotNBoxCT2.width=newSize[1]/2-35
			DotNBoxCT2.pos=[newSize[1]/2+15, newSize[2]-400]
		
			try (DotNBoxCT2.columns.item[0].width = newSize[1]/2-56) catch ()		
		
		grpRender.pos=[10, newSize[2]-90]
		grpRender.width=newSize[1]-20
			RenderPath.pos=[20, newSize[2]-70]
			RenderPath.width=newSize[1]-104
			btnOutput.pos=[newSize[1]-80, newSize[2]-70]
			chkMakeF.pos=[20, newSize[2]-42]
			btnRender.pos=[newSize[1]-80, newSize[2]-45]
			ddlType.pos=[newSize[1]-145, newSize[2]-42]
		)

-----------------------------------------------
--Progress, fill color and texture array
-----------------------------------------------
	fn doMaterialList materials = (
		--reset material and texture array
		DotNBoxMats1.items.clear()
		DotNBoxMats2.items.clear()
		colMats = #()
		colMatsLi = #()
		colMatsLiCl = #()
		
		if (materials.count == 0) then (
			MessageBox "There are no materials in your current scene!" title:ProgramName
			) else (
				for t = 1 to materials.count do (
					matlists materials[t]
					)			
				)
			
			--fill the listBox DotNBoxMats1 box 
			DotNBoxMats1.items.addRange colMatsLi
				
			for i = 1 to colMatsLi.count do (
				append colMatsLiCl (colMatsLi[i].clone())
				)
			DotNBoxMats2.items.addRange colMatsLiCl
		)
		
	fn doTextureList1 inFolder1 = (
		texFiles1 = #()
		colPathLi1 = #()
		
		files1 = getFiles ( inFolder1 + "\\*.*" )

		for tex in files1 do (
			file_ext = getFilenameType tex
			case of (
				(file_ext==".avi") : append texFiles1 tex
				(file_ext==".mpg") : append texFiles1 tex
				(file_ext==".mpeg") : append texFiles1 tex
				(file_ext==".bmp") : append texFiles1 tex
				(file_ext==".cin") : append texFiles1 tex
				(file_ext==".cws") : append texFiles1 tex
				(file_ext==".exr") : append texFiles1 tex
				(file_ext==".gif") : append texFiles1 tex
				(file_ext==".hdr") : append texFiles1 tex
				(file_ext==".pic") : append texFiles1 tex
				(file_ext==".ifl") : append texFiles1 tex
				(file_ext==".jpg") : append texFiles1 tex
				(file_ext==".jpe") : append texFiles1 tex
				(file_ext==".jpeg") : append texFiles1 tex
				(file_ext==".png") : append texFiles1 tex
				(file_ext==".psd") : append texFiles1 tex
				(file_ext==".mov") : append texFiles1 tex
				(file_ext==".rgb") : append texFiles1 tex
				(file_ext==".rgba") : append texFiles1 tex
				(file_ext==".sgi") : append texFiles1 tex
				(file_ext==".int") : append texFiles1 tex
				(file_ext==".inta") : append texFiles1 tex
				(file_ext==".bw") : append texFiles1 tex
				(file_ext==".rla") : append texFiles1 tex
				(file_ext==".rpf") : append texFiles1 tex
				(file_ext==".tga") : append texFiles1 tex
				(file_ext==".tif") : append texFiles1 tex
				(file_ext==".tiff") : append texFiles1 tex
				(file_ext==".yuv") : append texFiles1 tex
				(file_ext==".dds") : append texFiles1 tex
				)
			)
		
			for f = 1 to texFiles1.count do (
				li=dotNetObject "System.Windows.Forms.ListViewItem" texFiles1[f]
				append colPathLi1 li
				join colPath1 #(texFiles1[f])
				)
			--fill the listBox
			DotNBoxCT1.items.addRange colPathLi1
		)
		
	fn doTextureList2 inFolder2 = (
		texFiles2 = #()
		colPathLi2 = #()
		
		files2 = getFiles ( inFolder2 + "\\*.*" )
		
		for tex in files2 do (
			file_ext = getFilenameType tex
			case of (
				(file_ext==".avi") : append texFiles2 tex
				(file_ext==".mpg") : append texFiles2 tex
				(file_ext==".mpeg") : append texFiles2 tex
				(file_ext==".bmp") : append texFiles2 tex
				(file_ext==".cin") : append texFiles2 tex
				(file_ext==".cws") : append texFiles2 tex
				(file_ext==".exr") : append texFiles2 tex
				(file_ext==".gif") : append texFiles2 tex
				(file_ext==".hdr") : append texFiles2 tex
				(file_ext==".pic") : append texFiles2 tex
				(file_ext==".ifl") : append texFiles2 tex
				(file_ext==".jpg") : append texFiles2 tex
				(file_ext==".jpe") : append texFiles2 tex
				(file_ext==".jpeg") : append texFiles2 tex
				(file_ext==".png") : append texFiles2 tex
				(file_ext==".psd") : append texFiles2 tex
				(file_ext==".mov") : append texFiles2 tex
				(file_ext==".rgb") : append texFiles2 tex
				(file_ext==".rgba") : append texFiles2 tex
				(file_ext==".sgi") : append texFiles2 tex
				(file_ext==".int") : append texFiles2 tex
				(file_ext==".inta") : append texFiles2 tex
				(file_ext==".bw") : append texFiles2 tex
				(file_ext==".rla") : append texFiles2 tex
				(file_ext==".rpf") : append texFiles2 tex
				(file_ext==".tga") : append texFiles2 tex
				(file_ext==".tif") : append texFiles2 tex
				(file_ext==".tiff") : append texFiles2 tex
				(file_ext==".yuv") : append texFiles2 tex
				(file_ext==".dds") : append texFiles2 tex
				)
			)
		
			for f = 1 to texFiles2.count do (
				li=dotNetObject "System.Windows.Forms.ListViewItem" texFiles2[f]
				append colPathLi2 li
				join colPath2 #(texFiles2[f])
				)
			--fill the listBox
			DotNBoxCT2.items.addRange colPathLi2
		)	
		
	fn doColorList1 col = (
		colListLi1 = #()
	
		li=dotNetObject "System.Windows.Forms.ListViewItem" (col as string)
		li.backColor=li.backColor.fromARGB col.r col.g col.b
		if (col.r + col.g + col.b < 381) then (
			li.ForeColor=li.ForeColor.fromARGB 255 255 255
			) else (
				li.ForeColor=li.ForeColor.fromARGB 0 0 0
				)
		append colListLi1 li
		join colPath1 #(col)
		
		DotNBoxCT1.items.addRange colListLi1
		)
		
	fn doColorList2 col = (
		colListLi2 = #()
	
		li=dotNetObject "System.Windows.Forms.ListViewItem" (col as string)
		li.backColor=li.backColor.fromARGB col.r col.g col.b
		if (col.r + col.g + col.b < 381) then (
			li.ForeColor=li.ForeColor.fromARGB 255 255 255
			) else (
				li.ForeColor=li.ForeColor.fromARGB 0 0 0
				)
		append colListLi2 li
		join colPath2 #(col)
		
		DotNBoxCT2.items.addRange colListLi2
		)	
		
-----------------------------------------------
--Buttons
-----------------------------------------------	
on btnClear1 pressed do (
	colListLi1 = #()
	colPath1 = #()
	DotNBoxCT1.items.clear()
	texPath1.text = ""
	)	
	
on btnClear2 pressed do (
	colListLi2 = #()
	colPath2 = #()
	DotNBoxCT2.items.clear()
	texPath2.text = ""
	)
	
on btnSeMatAndTex pressed do (
	doMaterialList sceneMaterials
	)

on btnChangeTex1 pressed do (
	inFolder1 = getSavePath caption:"Select Path:" initialDir:(getDir #renderPresets + @"\")
	if inFolder1 == undefined do return false
	texPath1.text = inFolder1
	doTextureList1 inFolder1
	)
	
on btnChangeTex2 pressed do (
	inFolder2 = getSavePath caption:"Select Path:" initialDir:(getDir #renderPresets + @"\")
	if inFolder2 == undefined do return false
	texPath2.text = inFolder2
	doTextureList2 inFolder2
	)
	
on btnAddCol1 pressed do (
	doColorList1 colP.color
	)
	
on btnAddCol2 pressed do (
	doColorList2 colP2.color
	)		
	
on btnOutput pressed do (
	outFolder = getSavePath caption:"Select Path:" initialDir:(getDir #renderOutput + @"\")
	if outFolder == undefined do return false
	RenderPath.text = outFolder
	)		

on btnRender pressed do (
	local countCheck = 0
	local re = maxOps.GetCurRenderElementMgr()
	if (outFolder != undefined) then (
		
		for c = 1 to DotNBoxMats1.Items.count do (
			if (DotNBoxMats1.Items.Item[c-1].Checked == true) do (
				countCheck += c
				)
			)
		if (countCheck == 0) do (
			MessageBox "No Material selected!" title:ProgramName
			return false
			)
		--loop in material list 1	
		for l = 1 to colPath1.count do (
			for i = 1 to DotNBoxMats1.Items.count do (
				if (DotNBoxMats1.Items.Item[i-1].Checked == true) do (
					if (classof colMats[i] == Blend OR classof colMats[i] == Shellac OR classof colMats[i] == TopBottom \
						OR classof colMats[i] == doubleSided OR classof colMats[i] == Shell_Material OR classof colMats[i] == MultiMaterial \
						OR classof colMats[i] == CompositeMaterial) then (
							MessageBox ("Warning: You have select a \"" + classof colMats[i] as string + "\" material, this will not process!") title:ProgramName
							return false
						) else (
							processColTex colMats[i] colPath1[l]
							)
					) --if checked end
				)
			
			--loop in material list 2
			for ll = 1 to colPath2.count do (
				for ii = 1 to DotNBoxMats2.Items.count do (
					if (DotNBoxMats2.Items.Item[ii-1].Checked == true) do (
						if (classof colMats[ii] == Blend OR classof colMats[ii] == Shellac OR classof colMats[ii] == TopBottom \
							OR classof colMats[ii] == doubleSided OR classof colMats[ii] == Shell_Material OR classof colMats[ii] == MultiMaterial \
							OR classof colMats[ii] == CompositeMaterial) then (
								MessageBox ("Warning: You have select a \"" + classof colMats[ii] as string + "\" material, this will not process!") title:ProgramName
								return false
							) else (
								processColTex colMats[ii] colPath2[ll]
								)
						) --if checked end
					)
					
				try (outNameA = getFilenameFile colPath1[l]) catch (
					outNameAT = filterstring (colPath1[l] as string) " ()"
					outNameA = outNameAT[1]+"_"+outNameAT[2]+"-"+outNameAT[3]+"-"+outNameAT[4]
					)
				try (outNameB = getFilenameFile colPath2[ll]) catch (
					outNameBT = filterstring (colPath2[ll] as string) " ()"
					outNameB = outNameBT[1]+"_"+outNameBT[2]+"-"+outNameBT[3]+"-"+outNameBT[4]
					)	

				if (chkMakeF.checked == true) then (
					makeDir (outFolder + "\\" + outNameA + "_-_" + outNameB) all:false
					outF = (outFolder + "\\" + outNameA + "_-_" + outNameB + "\\" + outNameA + "_-_" + outNameB)
					) else (
						outF = (outFolder + "\\" + outNameA + "_-_" + outNameB)						
						)
				-- render
				renderSceneDialog.close()
				for r1 = 0 to re.numrenderelements() do re.SetRenderElementFilename r1 ""
				rendShowVFB = on
				rendSaveFile = on
				rendSaveFile = on
				rendOutputFilename = (outF + "_" + ddlType.items[ddlType.selection])
				renderSceneDialog.commit()
				max quick render

				local num3=""
					case rendTimeType of (
						1: num3 = ""
						2: (
							num1 = l - 1 + animationRange.start + rendFileNumberBase
							num2 = "000" + num1 as string 
							num3 = subString num2 (num2.count - 3) 4
							)
						3: (
							num1 = l - 1 + rendStart + rendFileNumberBase 
							num2 = "000" + num1 as string 
							num3 = subString num2 (num2.count - 3) 4
							)
						4: (
							num1 = filterstring rendPickupFrames ",- "
							num2 = "000" + num1[num1.count]
							num3 = subString num2 (num2.count - 3) 4
							)
					)

				if (openBitMap (outF + "_"+ num3 + ddlType.items[ddlType.selection]) == undefined) do (
					for r2 = 0 to re.numrenderelements() do re.SetRenderElementFilename r2 ""
					rendOutputFilename = ""
					renderSceneDialog.commit()
					return false
					)
					
				) --loop in material list 1 end
				
			
			)
			for r3 = 0 to re.numrenderelements() do re.SetRenderElementFilename r3 ""
			rendOutputFilename = ""
			renderSceneDialog.commit()
		) else (
			MessageBox "Please select a output folder!" title:ProgramName
			)
	)
	
	) --rollout end
	
try ( destroyDialog MultiChangeColorTextureAndRender )
	catch (	MessageBox "Dialog not found!" )

	createDialog MultiChangeColorTextureAndRender style:#(#style_titlebar, #style_border, #style_sysmenu, #style_minimizebox, #style_resizing)
) --script end
