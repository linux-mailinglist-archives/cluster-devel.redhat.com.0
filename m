Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F6F6D79EB
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 12:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680691160;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sBkFB8fAWBN3smTHXDCk9Sdy8T63XJRLVaCuva4Dlh8=;
	b=LGSYmZxM4cB4/IKjmlLnTc15cJ8kKwjbRXcA9mHpYrVe7xcwlmCWQ3YyU7oSoESYKk84Gj
	dQl+cLRDA/r3Viqp5amhNivG0CytDGHsXRzKVDBj5rvUnDhoq53J8Op110CBGk4mw44RiY
	LIQmsaQOt2jQRhcautyj76P4coGX9x4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-fBo08JtfPhqvsBqk_csTIA-1; Wed, 05 Apr 2023 06:39:16 -0400
X-MC-Unique: fBo08JtfPhqvsBqk_csTIA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FF96185A7A2;
	Wed,  5 Apr 2023 10:39:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 356B74020C83;
	Wed,  5 Apr 2023 10:39:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EA6221946597;
	Wed,  5 Apr 2023 10:39:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AAC4F1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 10:39:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 507724020C82; Wed,  5 Apr 2023 10:39:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 493504020C80
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 10:39:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C0D3101A552
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 10:39:13 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-GJonI1_bM9K5ryPR5oILhA-1; Wed, 05 Apr 2023 06:39:12 -0400
X-MC-Unique: GJonI1_bM9K5ryPR5oILhA-1
Received: by mail-qk1-f199.google.com with SMTP id
 c186-20020a379ac3000000b007484744a472so15717193qke.22
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 03:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680691151;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sBkFB8fAWBN3smTHXDCk9Sdy8T63XJRLVaCuva4Dlh8=;
 b=aYBe24akhwu5Og4iKsyAInoHWQlxwiaVMXEXvDE5O8pyi9kY7AhMppOh91M2/2tmfY
 17l1pu+UXao/T3Petl+zNhNGhIY4sZAwu27RcXBpAvJ8p2jfMqvu2CMx2Q5Tbn1yypww
 XrZK9uou3qoPgq1JHUPtybG5OeCNMK+OFyNdu+BBCcLxyHAodLiOZ7nzw6LLKJfejSUF
 1WWqnbI1SWHfiIMU3Fbk/ZrIR45nBOZd3HgfiSYCIevSe3dpceAaG1+8Q2a6LQ3G8fXQ
 Vk16w61+LhZhX93wY2TZMNDjVsMTUtppEviO6gaqBfWlzVtx9fpUsmFhYb4bdMfRyUT3
 u5Qw==
X-Gm-Message-State: AAQBX9e3JsUizv8br8hb6K5kVSGlR4nNHUQL2UGBUKKVAYRPIg5e8F1J
 Z1Pck/YSJ+AQjME0Cn3QRQTD/NtcKadbhdMKZvWxzmJbeQE5lmdtyZCCh1HqilAvhMyjhhQEteQ
 zbSsQzwgQRgofOmpHJ+XM
X-Received: by 2002:ac8:7e96:0:b0:3b6:323d:bcac with SMTP id
 w22-20020ac87e96000000b003b6323dbcacmr4150871qtj.32.1680691151323; 
 Wed, 05 Apr 2023 03:39:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYAf0v49WL6o/QofipBP4L4y6flhFYcYqZzNpajsevFC+xcPnxT0A0hb6dINwVq/YpVvvMSw==
X-Received: by 2002:ac8:7e96:0:b0:3b6:323d:bcac with SMTP id
 w22-20020ac87e96000000b003b6323dbcacmr4150840qtj.32.1680691150879; 
 Wed, 05 Apr 2023 03:39:10 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 r206-20020a3744d7000000b0074a0051fcd4sm4331706qka.88.2023.04.05.03.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:39:10 -0700 (PDT)
Date: Wed, 5 Apr 2023 12:39:04 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20230405103904.2ugfxqmuuqjd7itz@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-7-aalbersh@redhat.com>
 <20230404234019.GM3223426@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20230404234019.GM3223426@dread.disaster.area>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 06/23] fsverity: add drop_page()
 callout
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
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

On Wed, Apr 05, 2023 at 09:40:19AM +1000, Dave Chinner wrote:
> On Tue, Apr 04, 2023 at 04:53:02PM +0200, Andrey Albershteyn wrote:
> > Allow filesystem to make additional processing on verified pages
> > instead of just dropping a reference. This will be used by XFS for
> > internal buffer cache manipulation in further patches. The btrfs,
> > ext4, and f2fs just drop the reference.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/btrfs/verity.c         | 12 ++++++++++++
> >  fs/ext4/verity.c          |  6 ++++++
> >  fs/f2fs/verity.c          |  6 ++++++
> >  fs/verity/read_metadata.c |  4 ++--
> >  fs/verity/verify.c        |  6 +++---
> >  include/linux/fsverity.h  | 10 ++++++++++
> >  6 files changed, 39 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
> > index c5ff16f9e9fa..4c2c09204bb4 100644
> > --- a/fs/btrfs/verity.c
> > +++ b/fs/btrfs/verity.c
> > @@ -804,10 +804,22 @@ static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
> >  			       pos, buf, size);
> >  }
> >  
> > +/*
> > + * fsverity op that releases the reference obtained by ->read_merkle_tree_page()
> > + *
> > + * @page:  reference to the page which can be released
> > + *
> > + */
> > +static void btrfs_drop_page(struct page *page)
> > +{
> > +	put_page(page);
> > +}
> > +
> >  const struct fsverity_operations btrfs_verityops = {
> >  	.begin_enable_verity     = btrfs_begin_enable_verity,
> >  	.end_enable_verity       = btrfs_end_enable_verity,
> >  	.get_verity_descriptor   = btrfs_get_verity_descriptor,
> >  	.read_merkle_tree_page   = btrfs_read_merkle_tree_page,
> >  	.write_merkle_tree_block = btrfs_write_merkle_tree_block,
> > +	.drop_page		 = &btrfs_drop_page,
> >  };
> 
> Ok, that's a generic put_page() call.
> 
> ....
> > diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> > index f50e3b5b52c9..c2fc4c86af34 100644
> > --- a/fs/verity/verify.c
> > +++ b/fs/verity/verify.c
> > @@ -210,7 +210,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
> >  		if (is_hash_block_verified(vi, hpage, hblock_idx)) {
> >  			memcpy_from_page(_want_hash, hpage, hoffset, hsize);
> >  			want_hash = _want_hash;
> > -			put_page(hpage);
> > +			inode->i_sb->s_vop->drop_page(hpage);
> >  			goto descend;
> 
> 			fsverity_drop_page(hpage);
> 
> static inline void
> fsverity_drop_page(struct inode *inode, struct page *page)
> {
> 	if (inode->i_sb->s_vop->drop_page)
> 		inode->i_sb->s_vop->drop_page(page);
> 	else
> 		put_page(page);
> }
> 
> And then you don't need to add the functions to each of the
> filesystems nor make an indirect call just to run put_page().

Sure, this makes more sense, thank you!

-- 
- Andrey

