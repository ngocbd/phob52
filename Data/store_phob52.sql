USE [phob521]
GO
/****** Object:  StoredProcedure [dbo].[CategoryList]    Script Date: 7/27/2015 11:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------tao store procedure------------------------

CREATE Procedure [dbo].[CategoryList]
 as
 WITH tblTemp(ID,ParentID,Name,CategoryLevel,sx,Sort,metatitle,metades,Active,menu1,menu2,menu3,Description,image,detail)
	AS
	(
		SELECT wm.ID,wm.ParentID,wm.Name,0 as CategoryLevel,CAST( wm.Name AS NVARCHAR(250)) AS sx,wm.Sort,wm.MetaTitle, wm.MetaDes,wm.active,wm.menu1,wm.menu2,wm.menu3,wm.Description,wm.Image,wm.Detail
		FROM Categorys wm	WHERE wm.ParentID=0  
		UNION ALL
		SELECT wm.ID,wm.ParentID,wm.Name,
			t.CategoryLevel +1 AS CategoryLevel,CAST(RTRIM(t.sx) + wm.Name AS NVARCHAR(250)) AS sx,t.Sort,t.metatitle,t.metades,t.Active, t.menu1,t.menu2,t.menu3,t.Description,t.Image,t.Detail
		FROM Categorys wm INNER JOIN tblTemp t ON t.ID=wm.ParentID	 
	)
	SELECT ID,ParentID ,REPLIcate('----------- ',(CategoryLevel)) + Name AS Name, Sort, metatitle as MetaTitle, metades as MetaDes,Active, menu1,menu2,menu3,Description,Image,Detail
	FROM tblTemp	
	ORDER BY Sort,sx




GO
/****** Object:  StoredProcedure [dbo].[CategoryList1_1]    Script Date: 7/27/2015 11:18:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CategoryList1_1]
 as
 WITH tblTemp(ID,ParentID,Name,CategoryLevel,sx,Sort,metatitle,metades,Active,menu1,menu2,menu3,Description,image,detail)
	AS
	(
		SELECT wm.ID,wm.ParentID,wm.Name,0 as CategoryLevel,CAST( wm.Name AS NVARCHAR(250)) AS sx,wm.Sort,wm.MetaTitle, wm.MetaDes,wm.active,wm.menu1,wm.menu2,wm.menu3,wm.Description,wm.Image,wm.Detail
		FROM Categorys wm	WHERE wm.ParentID=0  
		UNION ALL
		SELECT wm.ID,wm.ParentID,wm.Name,
			t.CategoryLevel +1 AS CategoryLevel,CAST(RTRIM(t.sx) + wm.Name AS NVARCHAR(250)) AS sx,t.Sort,t.metatitle,t.metades,t.Active, t.menu1,t.menu2,t.menu3,t.Description,t.Image,t.Detail
		FROM Categorys wm INNER JOIN tblTemp t ON t.ID=wm.ParentID	 
	)
	SELECT ID,ParentID ,REPLIcate('----------- ',(CategoryLevel)) + Name AS Name, Sort, metatitle as MetaTitle, metades as MetaDes,Active, menu1,menu2,menu3,Description,Image,Detail
	FROM tblTemp	
	ORDER BY Sort,sx





GO
/****** Object:  StoredProcedure [dbo].[Menu1List]    Script Date: 7/27/2015 11:18:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Menu1List]
 as
 WITH tblTemp(ID,ParentID,Name, NameEn,CategoryLevel,sx, sx1,Sort,metatitle,metades,active,menu1,menu2,menu3,Description,image,detail,page,category,link, display, DescriptionEn, DetailEn, MetaTitleEn, MetaDesEn)
	AS
	(
		SELECT wm.ID,wm.ParentID,wm.Name, wm.NameEn,0 as CategoryLevel,CAST( wm.Name AS NVARCHAR(250)) AS sx,CAST( wm.NameEn AS NVARCHAR(250)) AS sx1,wm.Sort,wm.MetaTitle, wm.MetaDes,wm.Active,wm.menu1,wm.menu2,wm.menu3,wm.Description,wm.Image,wm.Detail, wm.Page, wm.Category, wm.Link, wm.Display,wm.DescriptionEn, wm.DetailEn, wm.MetaTitleEn, wm.MetaDesEn
		FROM Modules wm	WHERE wm.ParentID=0  
		UNION ALL
		SELECT wm.ID,wm.ParentID,wm.Name,wm.Name,
			t.CategoryLevel +1 AS CategoryLevel,CAST(RTRIM(t.sx) + wm.Name AS NVARCHAR(250)) AS sx,CAST(RTRIM(t.sx1) + wm.NameEn AS NVARCHAR(250)) AS sx1,t.Sort,t.metatitle,t.metades,t.active, t.menu1,t.menu2,t.menu3,t.Description,t.Image,t.Detail, t.page, t.category, t.link, t.display,t.DescriptionEn, t.DetailEn, t.MetaTitleEn, t.MetaDesEn
		FROM Modules wm  INNER JOIN tblTemp t ON t.ID=wm.ParentID 
	)
	SELECT ID,ParentID ,REPLIcate('----------- ',(CategoryLevel)) + Name AS Name,REPLIcate('----------- ',(CategoryLevel)) + NameEn AS NameEn, Sort, metatitle as MetaTitle, metades as MetaDes , Sort as Type,active, menu1,menu2,menu3,Description,Image,Detail,page, category,link, display,DescriptionEn, DetailEn, MetaTitleEn, MetaDesEn
	FROM tblTemp	
	ORDER BY Sort,ID



GO
/****** Object:  StoredProcedure [dbo].[Menu2_1List]    Script Date: 7/27/2015 11:18:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Menu2_1List]
 as
 WITH tblTemp(ID,ParentID,Name,CategoryLevel,sx,Sort,metatitle,metades,active,menu1,menu2,menu3,Description,image,detail,page,category,link,display)
	AS
	(
		SELECT wm.ID,wm.ParentID,wm.Name,0 as CategoryLevel,CAST( wm.Name AS NVARCHAR(250)) AS sx,wm.Sort,wm.MetaTitle, wm.MetaDes,wm.Active,wm.menu1,wm.menu2,wm.menu3,wm.Description,wm.Image,wm.Detail, wm.Page, wm.Category, wm.Link,wm.Display
		FROM Modules wm	WHERE wm.ParentID=0   and menu2=1
		UNION ALL
		SELECT wm.ID,wm.ParentID,wm.Name,
			t.CategoryLevel +1 AS CategoryLevel,CAST(RTRIM(t.sx) + wm.Name AS NVARCHAR(250)) AS sx,t.Sort,t.metatitle,t.metades,t.active, t.menu1,t.menu2,t.menu3,t.Description,t.Image,t.Detail, t.page, t.category, t.link,t.display
		FROM Modules wm  INNER JOIN tblTemp t ON t.ID=wm.ParentID 
	)
	SELECT ID,ParentID ,REPLIcate('----------- ',(CategoryLevel)) + Name AS Name, Sort, metatitle as MetaTitle, metades as MetaDes , Sort as Type,active, menu1,menu2,menu3,Description,Image,Detail,page, category, link, display
	FROM tblTemp	
	ORDER BY Sort,ID






GO
/****** Object:  StoredProcedure [dbo].[Menu2List]    Script Date: 7/27/2015 11:18:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Menu2List]
 as
 WITH tblTemp(ID,ParentID,Name,CategoryLevel,sx,Sort,metatitle,metades,active,menu1,menu2,menu3,Description,image,detail,page,category,link, display)
	AS
	(
		SELECT wm.ID,wm.ParentID,wm.Name,0 as CategoryLevel,CAST( wm.Name AS NVARCHAR(250)) AS sx,wm.Sort,wm.MetaTitle, wm.MetaDes,wm.Active,wm.menu1,wm.menu2,wm.menu3,wm.Description,wm.Image,wm.Detail, wm.Page, wm.Category, wm.Link, wm.Display
		FROM Modules wm	WHERE wm.ParentID=0   and menu2=1
		UNION ALL
		SELECT wm.ID,wm.ParentID,wm.Name,
			t.CategoryLevel +1 AS CategoryLevel,CAST(RTRIM(t.sx) + wm.Name AS NVARCHAR(250)) AS sx,t.Sort,t.metatitle,t.metades,t.active, t.menu1,t.menu2,t.menu3,t.Description,t.Image,t.Detail, t.page, t.category, t.link, t.display
		FROM Modules wm  INNER JOIN tblTemp t ON t.ID=wm.ParentID 
	)
	SELECT ID,ParentID ,REPLIcate('----------- ',(CategoryLevel)) + Name AS Name, Sort, metatitle as MetaTitle, metades as MetaDes , Sort as Type,active, menu1,menu2,menu3,Description,Image,Detail,page, category, link,display
	FROM tblTemp	
	ORDER BY Sort,ID





GO
/****** Object:  StoredProcedure [dbo].[Menu3List]    Script Date: 7/27/2015 11:18:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Menu3List]
 as
 WITH tblTemp(ID,ParentID,Name,CategoryLevel,sx,Sort,metatitle,metades,active,menu1,menu2,menu3,Description,image,detail,page,category,link,display)
	AS
	(
		SELECT wm.ID,wm.ParentID,wm.Name,0 as CategoryLevel,CAST( wm.Name AS NVARCHAR(250)) AS sx,wm.Sort,wm.MetaTitle, wm.MetaDes,wm.Active,wm.menu1,wm.menu2,wm.menu3,wm.Description,wm.Image,wm.Detail, wm.Page, wm.Category,wm.Link, wm.Display
		FROM Modules wm	WHERE wm.ParentID=0   and menu3=1
		UNION ALL
		SELECT wm.ID,wm.ParentID,wm.Name,
			t.CategoryLevel +1 AS CategoryLevel,CAST(RTRIM(t.sx) + wm.Name AS NVARCHAR(250)) AS sx,t.Sort,t.metatitle,t.metades,t.active, t.menu1,t.menu2,t.menu3,t.Description,t.Image,t.Detail, t.page, t.category,t.link, t.display
		FROM Modules wm  INNER JOIN tblTemp t ON t.ID=wm.ParentID 
	)
	SELECT ID,ParentID ,REPLIcate('----------- ',(CategoryLevel)) + Name AS Name, Sort, metatitle as MetaTitle, metades as MetaDes , Sort as Type,active, menu1,menu2,menu3,Description,Image,Detail,page, category, link, display
	FROM tblTemp	
	ORDER BY Sort,ID






GO
/****** Object:  StoredProcedure [dbo].[MenuList]    Script Date: 7/27/2015 11:18:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[MenuList]
 as
 WITH tblTemp(ID,ParentID,Name, NameEn,CategoryLevel,sx, sx1,Sort,metatitle,metades,active,menu1,menu2,menu3,Description,image,detail,page,category,link, display, DescriptionEn, DetailEn, MetaTitleEn, MetaDesEn)
	AS
	(
		SELECT wm.ID,wm.ParentID,wm.Name, wm.NameEn,0 as CategoryLevel,CAST( wm.Name AS NVARCHAR(250)) AS sx,CAST( wm.NameEn AS NVARCHAR(250)) AS sx1,wm.Sort,wm.MetaTitle, wm.MetaDes,wm.Active,wm.menu1,wm.menu2,wm.menu3,wm.Description,wm.Image,wm.Detail, wm.Page, wm.Category, wm.Link, wm.Display,wm.DescriptionEn, wm.DetailEn, wm.MetaTitleEn, wm.MetaDesEn
		FROM Modules wm	WHERE wm.ParentID=0  
		UNION ALL
		SELECT wm.ID,wm.ParentID,wm.Name,wm.Name,
			t.CategoryLevel +1 AS CategoryLevel,CAST(RTRIM(t.sx) + wm.Name AS NVARCHAR(250)) AS sx,CAST(RTRIM(t.sx1) + wm.NameEn AS NVARCHAR(250)) AS sx1,t.Sort,t.metatitle,t.metades,t.active, t.menu1,t.menu2,t.menu3,t.Description,t.Image,t.Detail, t.page, t.category, t.link, t.display,t.DescriptionEn, t.DetailEn, t.MetaTitleEn, t.MetaDesEn
		FROM Modules wm  INNER JOIN tblTemp t ON t.ID=wm.ParentID 
	)
	SELECT ID,ParentID ,REPLIcate('----------- ',(CategoryLevel)) + Name AS Name,REPLIcate('----------- ',(CategoryLevel)) + NameEn AS NameEn, Sort, metatitle as MetaTitle, metades as MetaDes , Sort as Type,active, menu1,menu2,menu3,Description,Image,Detail,page, category,link, display,DescriptionEn, DetailEn, MetaTitleEn, MetaDesEn
	FROM tblTemp	
	ORDER BY Sort,ID



GO
