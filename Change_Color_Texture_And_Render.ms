/*
----------------------------------------------------------------------------------------------------------------------
::
::    Description: This MaxScript is for changing color and texture and render all in batch
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
--  Script Name: Change Color Texture And Render
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

rollout ChangeColorTextureAndRender "Change Color Texture And Render" width:400 height:720 (
	
	local ProgramName = "Change Color Texture And Render"
	local colPathLi = #()
	local colPath = #()
	local colListLi = #()
	local colList = #()
	local outFolder = undefined

	groupBox grpSeMyTex "Collection From All Materials:" pos:[10,10] width:380 height:220
		button btnSeMatAndTex "Collect Materials" pos:[20,30] width:100 height:20
		dotNetControl DotNBoxMats "system.windows.forms.listView" pos:[20,60] width:360 height:160

	groupBox grpColTex "Colors and Textures:" pos:[10,230] width:380 height:400
		button btnClear "Clear List" pos:[320,245] width:60 height:18
		label texInfo "Path To Texture Folder:" pos:[20,250]
		editText texPath "" pos:[16,270] width:300 readOnly:true
		button btnChangeTex "Browse" pos:[320,270] width:60 height:18
		colorPicker colP "Color:" pos:[20,295] width:100 height:18 color:(color 100 255 100) modal:false

		button btnAddCol "Add Color" pos:[320,295] width:60 height:18
		dotNetControl DotNBoxCT "system.windows.forms.listView" pos:[20,320] width:360 height:300

	groupBox grpRender "Render Output:" pos:[10,630] width:380 height:80
		editText RenderPath "" pos:[16,650] width:300 readOnly:true
		button btnOutput "Output" pos:[320,650] width:60 height:18
		checkBox chkMakeF "Sub Folders" pos:[20,678] width:80 checked:true
		dropDownList ddlType "" pos:[255,678] width:60 items:#(".bmp", ".cin", ".exr", ".pic", ".jpg", ".jpe", ".jpeg", ".png", ".rgb", ".rgba", ".sgi", ".int", ".rla", ".rpf", ".tga", ".tif") selection:8
		button btnRender "Render" pos:[320,675] width:60 height:24

	-----------------------------------------------
	--DotNet Listview
	-----------------------------------------------
	
	on ChangeColorTextureAndRender open do (
		DotNBoxMats.columns.add "Material List" 339
		DotNBoxMats.view=(dotNetClass "system.windows.forms.view").details
		DotNBoxMats.FullRowSelect=true
		DotNBoxMats.GridLines=false
		DotNBoxMats.MultiSelect=false
		DotNBoxMats.CheckBoxes=true
		cb = ((colorman.getColor #background)*255+20) as color
		DotNBoxMats.BackColor = (dotNetClass "System.Drawing.Color").fromARGB cb.r cb.g cb.b
		cf = ((colorman.getColor #text)*255+30) as color
		DotNBoxMats.ForeColor = (dotNetClass "System.Drawing.Color").fromARGB cf.r cf.g cf.b
		
		DotNBoxCT.columns.add "Colors and Textures" 339
		DotNBoxCT.view=(dotNetClass "system.windows.forms.view").details
		DotNBoxCT.FullRowSelect=true
		DotNBoxCT.GridLines=false
		DotNBoxCT.MultiSelect=false
		cTb = ((colorman.getColor #background)*255+20) as color
		DotNBoxCT.BackColor = (dotNetClass "System.Drawing.Color").fromARGB cTb.r cTb.g cTb.b
		cTf = ((colorman.getColor #text)*255+30) as color
		DotNBoxCT.ForeColor = (dotNetClass "System.Drawing.Color").fromARGB cTf.r cTf.g cTf.b
		)
	
	-----------------------------------------------
	--resize statment
	-----------------------------------------------
	on ChangeColorTextureAndRender resized newSize do (

		grpSeMyTex.width=newSize[1]-20
		grpSeMyTex.height=newSize[2]-500
			DotNBoxMats.width=newSize[1]-40
			DotNBoxMats.height=newSize[2]-560
		
			try (DotNBoxMats.columns.item[0].width = newSize[1]-61) catch ()
		
		grpColTex.pos=[10, newSize[2]-490]
		grpColTex.width=newSize[1]-20
			btnClear.pos=[newSize[1]-80, newSize[2]-475]
			texInfo.pos=[20, newSize[2]-470]
			texPath.pos=[20, newSize[2]-450]
			texPath.width=newSize[1]-105
			btnChangeTex.pos=[newSize[1]-80, newSize[2]-450]
			colP.pos=[53, newSize[2]-425]
			btnAddCol.pos=[newSize[1]-80, newSize[2]-425]
			DotNBoxCT.width=newSize[1]-40
			DotNBoxCT.pos=[20, newSize[2]-400]
		
			try (DotNBoxCT.columns.item[0].width = newSize[1]-61) catch ()
		
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
		DotNBoxMats.items.clear()
		colMats = #()
		colMatsLi = #()
		
		if (materials.count == 0) then (
			MessageBox "There are no materials in your current scene!" title:ProgramName
			) else (
				for t = 1 to materials.count do (
					matlists materials[t]
					)			
				)
			
			--fill the listBox DotNBoxMats box 
			DotNBoxMats.items.addRange colMatsLi
		)
		
	fn doTextureList inFolder = (
		texFiles = #()
		colPathLi = #()
		
		files = getFiles ( inFolder + "\\*.*" )
		
		for tex in files do (
			file_ext = getFilenameType tex
			case of (
				(file_ext==".avi") : append texFiles tex
				(file_ext==".mpg") : append texFiles tex
				(file_ext==".mpeg") : append texFiles tex
				(file_ext==".bmp") : append texFiles tex
				(file_ext==".cin") : append texFiles tex
				(file_ext==".cws") : append texFiles tex
				(file_ext==".exr") : append texFiles tex
				(file_ext==".gif") : append texFiles tex
				(file_ext==".hdr") : append texFiles tex
				(file_ext==".pic") : append texFiles tex
				(file_ext==".ifl") : append texFiles tex
				(file_ext==".jpg") : append texFiles tex
				(file_ext==".jpe") : append texFiles tex
				(file_ext==".jpeg") : append texFiles tex
				(file_ext==".png") : append texFiles tex
				(file_ext==".psd") : append texFiles tex
				(file_ext==".mov") : append texFiles tex
				(file_ext==".rgb") : append texFiles tex
				(file_ext==".rgba") : append texFiles tex
				(file_ext==".sgi") : append texFiles tex
				(file_ext==".int") : append texFiles tex
				(file_ext==".inta") : append texFiles tex
				(file_ext==".bw") : append texFiles tex
				(file_ext==".rla") : append texFiles tex
				(file_ext==".rpf") : append texFiles tex
				(file_ext==".tga") : append texFiles tex
				(file_ext==".tif") : append texFiles tex
				(file_ext==".tiff") : append texFiles tex
				(file_ext==".yuv") : append texFiles tex
				(file_ext==".dds") : append texFiles tex
				)
			)
		
			for f = 1 to texFiles.count do (
				li=dotNetObject "System.Windows.Forms.ListViewItem" texFiles[f]
				append colPathLi li
				join colPath #(texFiles[f])
				)
			--fill the listBox
			DotNBoxCT.items.addRange colPathLi
		)
		
	fn doColorList col = (
		colListLi = #()
	
		li=dotNetObject "System.Windows.Forms.ListViewItem" (col as string)
		li.backColor=li.backColor.fromARGB col.r col.g col.b
		if (col.r + col.g + col.b < 381) then (
			li.ForeColor=li.ForeColor.fromARGB 255 255 255
			) else (
				li.ForeColor=li.ForeColor.fromARGB 0 0 0
				)
		append colListLi li
		join colPath #(col)
		
		DotNBoxCT.items.addRange colListLi
		)
		
-----------------------------------------------
--Buttons
-----------------------------------------------	
on btnClear pressed do (
	colListLi = #()
	colPath = #()
	DotNBoxCT.items.clear()
	texPath.text = ""
	)		
		
on btnSeMatAndTex pressed do (
	doMaterialList sceneMaterials
	)

on btnChangeTex pressed do (
	inFolder = getSavePath caption:"Select Path:" initialDir:(getDir #renderPresets + @"\")
	if inFolder == undefined do return false
	texPath.text = inFolder
	doTextureList inFolder
	)
	
on btnAddCol pressed do (
	doColorList colP.color
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
		
		for c = 1 to DotNBoxMats.Items.count do (
			if (DotNBoxMats.Items.Item[c-1].Checked == true) do (
				countCheck += c
				)
			)
		if (countCheck == 0) do (
			MessageBox "No Material selected!" title:ProgramName
			return false
			)
			
		for l = 1 to colPath.count do (
			for i = 1 to DotNBoxMats.Items.count do (
				if (DotNBoxMats.Items.Item[i-1].Checked == true) do (
					if (classof colMats[i] == Blend OR classof colMats[i] == Shellac OR classof colMats[i] == TopBottom \
						OR classof colMats[i] == doubleSided OR classof colMats[i] == Shell_Material OR classof colMats[i] == MultiMaterial \
						OR classof colMats[i] == CompositeMaterial) then (
							MessageBox ("Warning: You have select a \"" + classof colMats[i] as string + "\" material, this will not process!") title:ProgramName
							return false
						) else (
							case classof colMats[i] of (
								Arch___Design__mi: (
									try (colMats[i].diff_color_map = Bitmaptexture fileName:colPath[l]
										) catch (
											colMats[i].diff_color_map = undefined
											colMats[i].diff_color = colPath[l]
											)	
									)
								StandardMaterial: (
									try (colMats[i].diffuseMap = Bitmaptexture fileName:colPath[l]
										) catch (
											colMats[i].diffuseMap = undefined
											colMats[i].Diffuse = colPath[l]
											colMats[i].ambient = colPath[l]
											)	
									)	
								Car_Paint_Material__mi: (
									try (colMats[i].base_color.shader = Bitmaptexture fileName:colPath[l]
										) catch (
											colMats[i].base_color.shader = undefined
											colMats[i].base_color.paramName = ""
											colMats[i].base_color = colPath[l]
											)	
									)	
								Architectural: (
									try (colMats[i].diffuseMap = Bitmaptexture fileName:colPath[l]
										) catch (
											colMats[i].diffuseMap = undefined
											colMats[i].Diffuse = colPath[l]
											)	
									)
								)
							)
					) --if checked end
				)
			if (chkMakeF.checked == true) then (
				try (makeDir (outFolder + "\\" + getFilenameFile colPath[l] ) all:false
					outF = (outFolder + "\\" + getFilenameFile colPath[l] + "\\" + getFilenameFile colPath[l])
					) catch (
						colStr1 = filterstring (colPath[l] as string) " ()"
						colStr2 = colStr1[1]+"_"+colStr1[2]+"-"+colStr1[3]+"-"+colStr1[4]
						makeDir (outFolder + "\\" + colStr2 ) all:false
						outF = (outFolder + "\\" + colStr2 as string + "\\" + colStr2)
						)
				) else (
					try (
					outF = (outFolder + "\\" + getFilenameFile colPath[l])
					) catch (
						colStr1 = filterstring (colPath[l] as string) " ()"
						colStr2 = colStr1[1]+"_"+colStr1[2]+"-"+colStr1[3]+"-"+colStr1[4]
						outF = (outFolder + "\\" + colStr2)
						)						
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
			)
			for r3 = 0 to re.numrenderelements() do re.SetRenderElementFilename r3 ""
			rendOutputFilename = ""
			renderSceneDialog.commit()
		) else (
			MessageBox "Please select a output folder!" title:ProgramName
			)
	)
	
	) --rollout end
	
try ( destroyDialog ChangeColorTextureAndRender )
	catch (	MessageBox "Dialog not found!" )

	createDialog ChangeColorTextureAndRender style:#(#style_titlebar, #style_border, #style_sysmenu, #style_minimizebox, #style_resizing)
) --script end
