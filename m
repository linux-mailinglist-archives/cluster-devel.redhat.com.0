Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2166D83A6
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 18:27:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680712060;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xpkEDS6jt39qufg3GMcbXZKRt5qOSbn/1OJhbiuzI9E=;
	b=cMCCSKmbP7y/Vmz2M+e328pQU2K23gPjoVrasdqoczaJDjKDWAsJjuk7331pvLKceJJhBg
	Ijb09OgvsWotUZcYbQ76JjEgfVCEOkf5i+zGcuotwo6OfWfoOrjs6aqcQvk3TDHlK7iaN4
	LXuqX0j08CXkp6RjWCYcZXBs5WVM7+o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-YlnJiD3tPbqyKRq8_UBUlg-1; Wed, 05 Apr 2023 12:27:36 -0400
X-MC-Unique: YlnJiD3tPbqyKRq8_UBUlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD92F38221CA;
	Wed,  5 Apr 2023 16:27:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B60840C20FA;
	Wed,  5 Apr 2023 16:27:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4CE691946597;
	Wed,  5 Apr 2023 16:27:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 835BC1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 16:27:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4874440BC797; Wed,  5 Apr 2023 16:27:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40E8440C6EC4
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 16:27:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23EE2185A791
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 16:27:33 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-iIZuAX_hNeaGBNy6Gy6mFw-1; Wed, 05 Apr 2023 12:27:32 -0400
X-MC-Unique: iIZuAX_hNeaGBNy6Gy6mFw-1
Received: by mail-qk1-f199.google.com with SMTP id
 z187-20020a3765c4000000b007468706dfb7so16318683qkb.9
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 09:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680712051;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpkEDS6jt39qufg3GMcbXZKRt5qOSbn/1OJhbiuzI9E=;
 b=jQiF1Pio60b+OREks0sTH08SzqTQf+QIYzJl7p/pheXwaIiEBJVhHyg4GY90SmHOML
 ULBi9P6U/C51PB4vUSfpMfwSBoIIj1EWAX9PJqBOln+MdKCdWD7Z834g+a/KOjAk9575
 Q9oQpPHtipyGfk5Nto8UOU4t5dbI5TqXz2LGuRaR0gJW4+HOigsUDklg9V24/CApM5Xl
 iJUXsiKdny4OCt4g09mwm2KvUnpR5w+NjIOc4m2UCkUnzxPvnmTadA2dY7G38fDZsfJq
 gRSDAbl8XB9/HmpjR9Xd4AH/ZblAaYlhGQBbUzp/ERM+kTzqkihnH5n/bNJn791m4ptf
 1sug==
X-Gm-Message-State: AAQBX9ccsxNSFF6Vz1vgyoNgjOspdpYrGNr1zLDNApFY2D8imL2e1txy
 y6nmv531XglCkLi5YUFyqwCwbbD5HGnAP+NdD3EPso9Madpy9QzFHoIsxP/g0pol++WxgPVTN3J
 uUdpNURoGUjos5xsrQeKe
X-Received: by 2002:a05:6214:1c8d:b0:5bb:eefc:1624 with SMTP id
 ib13-20020a0562141c8d00b005bbeefc1624mr9853046qvb.27.1680712051483; 
 Wed, 05 Apr 2023 09:27:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZZl4q26mcUoNHuCokraSI3hi88peqAYHPpgY7Wvk0Gvn/BxgeqpN4NaYegoUGQwHkcsJ0yow==
X-Received: by 2002:a05:6214:1c8d:b0:5bb:eefc:1624 with SMTP id
 ib13-20020a0562141c8d00b005bbeefc1624mr9853021qvb.27.1680712051206; 
 Wed, 05 Apr 2023 09:27:31 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 r206-20020a3744d7000000b0074a0051fcd4sm4559684qka.88.2023.04.05.09.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:27:30 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:27:26 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230405162726.4d7bu3uz63w4cdkz@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404163942.GD109974@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230404163942.GD109974@frogsfrogsfrogs>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 00/23] fs-verity support for XFS
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
Cc: fsverity@lists.linux.dev, linux-ext4@vger.kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darrick,

On Tue, Apr 04, 2023 at 09:39:42AM -0700, Darrick J. Wong wrote:
> On Tue, Apr 04, 2023 at 04:52:56PM +0200, Andrey Albershteyn wrote:
> > Hi all,
> > 
> > This is V2 of fs-verity support in XFS. In this series I did
> > numerous changes from V1 which are described below.
> > 
> > This patchset introduces fs-verity [5] support for XFS. This
> > implementation utilizes extended attributes to store fs-verity
> > metadata. The Merkle tree blocks are stored in the remote extended
> > attributes.
> > 
> > A few key points:
> > - fs-verity metadata is stored in extended attributes
> > - Direct path and DAX are disabled for inodes with fs-verity
> > - Pages are verified in iomap's read IO path (offloaded to
> >   workqueue)
> > - New workqueue for verification processing
> > - New ro-compat flag
> > - Inodes with fs-verity have new on-disk diflag
> > - xfs_attr_get() can return buffer with the attribute
> > 
> > The patchset is tested with xfstests -g auto on xfs_1k, xfs_4k,
> > xfs_1k_quota, and xfs_4k_quota. Haven't found any major failures.
> > 
> > Patches [6/23] and [7/23] touch ext4, f2fs, btrfs, and patch [8/23]
> > touches erofs, gfs2, and zonefs.
> > 
> > The patchset consist of four parts:
> > - [1..4]: Patches from Parent Pointer patchset which add binary
> >           xattr names with a few deps
> > - [5..7]: Improvements to core fs-verity
> > - [8..9]: Add read path verification to iomap
> > - [10..23]: Integration of fs-verity to xfs
> > 
> > Changes from V1:
> > - Added parent pointer patches for easier testing
> > - Many issues and refactoring points fixed from the V1 review
> > - Adjusted for recent changes in fs-verity core (folios, non-4k)
> > - Dropped disabling of large folios
> > - Completely new fsverity patches (fix, callout, log_blocksize)
> > - Change approach to verification in iomap to the same one as in
> >   write path. Callouts to fs instead of direct fs-verity use.
> > - New XFS workqueue for post read folio verification
> > - xfs_attr_get() can return underlying xfs_buf
> > - xfs_bufs are marked with XBF_VERITY_CHECKED to track verified
> >   blocks
> > 
> > kernel:
> > [1]: https://github.com/alberand/linux/tree/xfs-verity-v2
> > 
> > xfsprogs:
> > [2]: https://github.com/alberand/xfsprogs/tree/fsverity-v2
> 
> Will there any means for xfs_repair to check the merkle tree contents?
> Should it clear the ondisk inode flag if it decides to trash the xattr
> structure, or is it ok to let the kernel deal with flag set and no
> verity data?

The fsverity-util can calculate merkle tree offline, so, it's
possible for xfs_repair to do the same and compare, also it can
check that all merkle tree blocks are there. The flag without tree
is probably bad as all reading ops will fail and it won't be
possible to regenerate the tree (enable also checks for flag).

-- 
- Andrey

