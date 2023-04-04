Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 166746D70F1
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 01:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680652607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CiwVxtHqh7PtMKcIrbTly4vzLJ3BWefIHUj9tJBpUIs=;
	b=cHTvyazopO4SSUXn5iskTaVEiRmHi6WhIfsw6vm1ZntcXg1Y3XBvkhZZByjv+WmqNMzZg5
	ShR5FULC4pZHcpWFDkPPKKaHULyRpm2Wmp7eeh4lPKKGSSZTVNuJ92GlnfsALXR1NiWDPj
	PEZKmc9FM995lLGUpvJyvAWbrG1/zf0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-N586qp91PIGX0mCFoJ4RnA-1; Tue, 04 Apr 2023 19:56:43 -0400
X-MC-Unique: N586qp91PIGX0mCFoJ4RnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB98585C06B;
	Tue,  4 Apr 2023 23:56:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09BBB1121314;
	Tue,  4 Apr 2023 23:56:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A82171946A43;
	Tue,  4 Apr 2023 23:56:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 033891946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 23:56:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9CF4D2166B29; Tue,  4 Apr 2023 23:56:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 951CC2166B26
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 23:56:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7353D3C0E443
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 23:56:39 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-vqiCtYcQNt-vMWMBndBprg-1; Tue, 04 Apr 2023 19:56:37 -0400
X-MC-Unique: vqiCtYcQNt-vMWMBndBprg-1
Received: by mail-pf1-f178.google.com with SMTP id u38so22542460pfg.10
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 16:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680652597;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CiwVxtHqh7PtMKcIrbTly4vzLJ3BWefIHUj9tJBpUIs=;
 b=oiWM5PU+10fasmX3npOwMP+qge8WUNxJjMvp27q7olKDwttLcGaUJPGgNFhGz4Qbkv
 gEddxKE4Gu9VnNcKaauxa45P8gwyJnlg/i6S+LurHwIOI/Cqy4Iy77WYYNqw6raovoyU
 1qemUUlsqMOnV6MC7dyLLeuOFNOeDth14ctX25+4F4lhdT9XEkrje/xmtv3SBnxXqZGG
 XXb07Fgzocd9DkRQ5w+Pqg5DW6dQ368AdWGqHCMfiHekV46CqFkYTKZINcD1JoSUYuay
 +dShFvjU/tpoCCdhLrqRiGTDnk3RfErNLTdsrVy7gfnImITVAs1b9zH+R8oSwgZKWP7q
 ly0w==
X-Gm-Message-State: AAQBX9fSsQiZIRGiBMYi49crxZcPgmxKDx+0ylHOW+o5/s+ZLeb6XMDU
 fvUzKidvZXrBh/GCPnaKejXapQ==
X-Google-Smtp-Source: AKy350boc1NJttMEXbPWdN9rfQR7KWvZb/0IvD3DuAJJ+io4CZz0OVS7AP+iey99+szOCn0Wgij/bQ==
X-Received: by 2002:a62:6454:0:b0:626:7c43:7cb8 with SMTP id
 y81-20020a626454000000b006267c437cb8mr3631280pfb.20.1680652596758; 
 Tue, 04 Apr 2023 16:56:36 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 a18-20020a656412000000b005136b93f8e9sm8146027pgv.14.2023.04.04.16.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 16:56:36 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pjqVt-00H7ij-6l; Wed, 05 Apr 2023 09:56:33 +1000
Date: Wed, 5 Apr 2023 09:56:33 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230404235633.GN3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-17-aalbersh@redhat.com>
 <20230404224123.GD1893@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20230404224123.GD1893@sol.localdomain>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
 Andrey Albershteyn <aalbersh@redhat.com>, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 04, 2023 at 03:41:23PM -0700, Eric Biggers wrote:
> Hi Andrey,
> 
> On Tue, Apr 04, 2023 at 04:53:12PM +0200, Andrey Albershteyn wrote:
> > Add flag to mark inodes which have fs-verity enabled on them (i.e.
> > descriptor exist and tree is built).
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/ioctl.c                 | 4 ++++
> >  fs/xfs/libxfs/xfs_format.h | 4 +++-
> >  fs/xfs/xfs_inode.c         | 2 ++
> >  fs/xfs/xfs_iops.c          | 2 ++
> >  include/uapi/linux/fs.h    | 1 +
> >  5 files changed, 12 insertions(+), 1 deletion(-)
> [...]
> > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > index b7b56871029c..5172a2eb902c 100644
> > --- a/include/uapi/linux/fs.h
> > +++ b/include/uapi/linux/fs.h
> > @@ -140,6 +140,7 @@ struct fsxattr {
> >  #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
> >  #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
> >  #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
> > +#define FS_XFLAG_VERITY		0x00020000	/* fs-verity sealed inode */
> >  #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
> >  
> 
> I don't think "xfs: add inode on-disk VERITY flag" is an accurate description of
> a patch that involves adding something to the UAPI.

Well it does that, but it also adds the UAPI for querying the
on-disk flag via the FS_IOC_FSGETXATTR interface as well.  It
probably should be split up into two patches.

> Should the other filesystems support this new flag too?

I think they should get it automatically now that it has been
defined for FS_IOC_FSGETXATTR and added to the generic fileattr flag
fill functions in fs/ioctl.c.

> I'd also like all ways of getting the verity flag to continue to be mentioned in
> Documentation/filesystems/fsverity.rst.  The existing methods (FS_IOC_GETFLAGS
> and statx) are already mentioned there.

*nod*

-Dave.
-- 
Dave Chinner
david@fromorbit.com

