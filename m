Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2756D7AAC
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 13:08:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680692890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=LzJaUmfW7LSdhmFGvI4GPq0lFJqiEtn70THgtiWFu7E=;
	b=ZEFENim158rMfFEh0Oc07gmDjSxvtYK0btNi4khE4g2WPG/aelYHzPIdd/Q5tLFn+2zbKu
	anHyNc03Ro5oO6uEmAnRSo19sOHEA02BlhhsB5eiYCPraIhurXW+CUAnraIepGS3HYVU8Y
	TRxGf6EpnvkDFiRxanx6GXuPF/XVi5w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-SFcW6M6eMpCoFE5o2OmGKg-1; Wed, 05 Apr 2023 07:08:01 -0400
X-MC-Unique: SFcW6M6eMpCoFE5o2OmGKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 583F1830FAF;
	Wed,  5 Apr 2023 11:08:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 48A6CC158BA;
	Wed,  5 Apr 2023 11:08:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2AAE1946597;
	Wed,  5 Apr 2023 11:07:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8B6581946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 11:07:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6D13840BC797; Wed,  5 Apr 2023 11:07:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6618540C6EC4
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 11:07:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49260380662E
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 11:07:59 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-AawbiqNNMhyWI302NZdE7w-1; Wed, 05 Apr 2023 07:07:58 -0400
X-MC-Unique: AawbiqNNMhyWI302NZdE7w-1
Received: by mail-qt1-f197.google.com with SMTP id
 h6-20020a05622a170600b003e22c6de617so24233448qtk.13
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 04:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680692877;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LzJaUmfW7LSdhmFGvI4GPq0lFJqiEtn70THgtiWFu7E=;
 b=sjGt6ScTX+17UR36E6GH90s9ej8w+7CuP28XkYLQoaUqz2mmnD1Se/ZZ46khn4BIT8
 8YZnacjyL6YNGVC3WYjlg5uVZ8iPtIMG6fXZcHMsnwTL//7rfWxsWUgeHROyL0NsvAlE
 2r6Koe6SoF1WJyi9AWE2x29ZgDsgzeDpNpAFs5gd/hSyR2QUcb63DkcHjsOwYbsTO4lf
 CjsAEpLI6vb65Fz4dkTIXf6kT4zVVMtnICX6EznFeNNcfuyW36lQeG1q+uGLbL7y+dqt
 ET+oIUkeiW12kxbmHYaRrzPDQngS0dXArZ7DclHZiGZbXgjpmhWcgfs3zOMCdhXILfbr
 266g==
X-Gm-Message-State: AAQBX9cwAj04ANKKJppbDt6JIE4UV/lIIO9F7xIeCnLvA6disCw9T33y
 KzdpatgLdypCQkH6D9fZg18BOQMbDE6R/7PW7pCs/ZPLlXD4TVm6rcUz3XTCkLoa5d48mzKHVUJ
 7asS6/yP6cqLWf2jkX+CR
X-Received: by 2002:a05:622a:1a9a:b0:3d2:a927:21b8 with SMTP id
 s26-20020a05622a1a9a00b003d2a92721b8mr4385135qtc.11.1680692877542; 
 Wed, 05 Apr 2023 04:07:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZeP9y1P8OSuMOyueFPI4oWaLkw1tcoh1zocY7G03xptTKH+In+mgb9Q5Zm39xqD2zbBaEQ0g==
X-Received: by 2002:a05:622a:1a9a:b0:3d2:a927:21b8 with SMTP id
 s26-20020a05622a1a9a00b003d2a92721b8mr4385083qtc.11.1680692877295; 
 Wed, 05 Apr 2023 04:07:57 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 k19-20020ac84753000000b003dffd3d3df5sm3934121qtp.2.2023.04.05.04.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 04:07:57 -0700 (PDT)
Date: Wed, 5 Apr 2023 13:07:52 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Dave Chinner <david@fromorbit.com>, ebiggers@kernel.org
Message-ID: <20230405110752.ih5qvu2cr6folkds@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-17-aalbersh@redhat.com>
 <20230404224123.GD1893@sol.localdomain>
 <20230404235633.GN3223426@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20230404235633.GN3223426@dread.disaster.area>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 16/23] xfs: add inode on-disk VERITY
 flag
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric and Dave,

On Wed, Apr 05, 2023 at 09:56:33AM +1000, Dave Chinner wrote:
> On Tue, Apr 04, 2023 at 03:41:23PM -0700, Eric Biggers wrote:
> > Hi Andrey,
> > 
> > On Tue, Apr 04, 2023 at 04:53:12PM +0200, Andrey Albershteyn wrote:
> > > Add flag to mark inodes which have fs-verity enabled on them (i.e.
> > > descriptor exist and tree is built).
> > > 
> > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > ---
> > >  fs/ioctl.c                 | 4 ++++
> > >  fs/xfs/libxfs/xfs_format.h | 4 +++-
> > >  fs/xfs/xfs_inode.c         | 2 ++
> > >  fs/xfs/xfs_iops.c          | 2 ++
> > >  include/uapi/linux/fs.h    | 1 +
> > >  5 files changed, 12 insertions(+), 1 deletion(-)
> > [...]
> > > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > > index b7b56871029c..5172a2eb902c 100644
> > > --- a/include/uapi/linux/fs.h
> > > +++ b/include/uapi/linux/fs.h
> > > @@ -140,6 +140,7 @@ struct fsxattr {
> > >  #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
> > >  #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
> > >  #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
> > > +#define FS_XFLAG_VERITY		0x00020000	/* fs-verity sealed inode */
> > >  #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
> > >  
> > 
> > I don't think "xfs: add inode on-disk VERITY flag" is an accurate description of
> > a patch that involves adding something to the UAPI.
> 
> Well it does that, but it also adds the UAPI for querying the
> on-disk flag via the FS_IOC_FSGETXATTR interface as well.  It
> probably should be split up into two patches.

Sure.

> 
> > Should the other filesystems support this new flag too?
> 
> I think they should get it automatically now that it has been
> defined for FS_IOC_FSGETXATTR and added to the generic fileattr flag
> fill functions in fs/ioctl.c.
> 
> > I'd also like all ways of getting the verity flag to continue to be mentioned in
> > Documentation/filesystems/fsverity.rst.  The existing methods (FS_IOC_GETFLAGS
> > and statx) are already mentioned there.
> 
> *nod*
> 

Ok, sure, missed that. Will split this patch and add description.

-- 
- Andrey

