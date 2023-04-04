Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D72816D7043
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 00:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680648461;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pUEDQOM6/7fNwfS3q2k0TcloK0gRMFl9mHLH92OUgos=;
	b=OwPHj11pvgnsP7Qd/rbCKBhAu3qB76g0aVG0hXlorlBWQl8zy/HIfGeHkBCPRg/PWdDarG
	/bq5E5xSTl1Z6JxkbANxcrVngealnrJgNdNxhk8Kb4HtrZ9syvatLLo7zjAn0WGbSmz9bo
	5vAlWIAz6WnnkCeF6x/LPok6W0sch34=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-oGp1zkXLOGSgial2TXBqsw-1; Tue, 04 Apr 2023 18:47:38 -0400
X-MC-Unique: oGp1zkXLOGSgial2TXBqsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5A911C06ED0;
	Tue,  4 Apr 2023 22:47:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7E25140EBF4;
	Tue,  4 Apr 2023 22:47:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E7AE1946A43;
	Tue,  4 Apr 2023 22:47:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E0E021946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 22:47:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 95EFB492C18; Tue,  4 Apr 2023 22:47:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E9D6492C14
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 22:47:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 711963823A08
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 22:47:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-1gP5-cKLNpa-rwyQRHc73w-1; Tue, 04 Apr 2023 18:47:33 -0400
X-MC-Unique: 1gP5-cKLNpa-rwyQRHc73w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1ADE563598;
 Tue,  4 Apr 2023 22:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96D8C433D2;
 Tue,  4 Apr 2023 22:41:24 +0000 (UTC)
Date: Tue, 4 Apr 2023 15:41:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230404224123.GD1893@sol.localdomain>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-17-aalbersh@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230404145319.2057051-17-aalbersh@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

On Tue, Apr 04, 2023 at 04:53:12PM +0200, Andrey Albershteyn wrote:
> Add flag to mark inodes which have fs-verity enabled on them (i.e.
> descriptor exist and tree is built).
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> ---
>  fs/ioctl.c                 | 4 ++++
>  fs/xfs/libxfs/xfs_format.h | 4 +++-
>  fs/xfs/xfs_inode.c         | 2 ++
>  fs/xfs/xfs_iops.c          | 2 ++
>  include/uapi/linux/fs.h    | 1 +
>  5 files changed, 12 insertions(+), 1 deletion(-)
[...]
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index b7b56871029c..5172a2eb902c 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -140,6 +140,7 @@ struct fsxattr {
>  #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
>  #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
>  #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
> +#define FS_XFLAG_VERITY		0x00020000	/* fs-verity sealed inode */
>  #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
>  

I don't think "xfs: add inode on-disk VERITY flag" is an accurate description of
a patch that involves adding something to the UAPI.

Should the other filesystems support this new flag too?

I'd also like all ways of getting the verity flag to continue to be mentioned in
Documentation/filesystems/fsverity.rst.  The existing methods (FS_IOC_GETFLAGS
and statx) are already mentioned there.

- Eric

