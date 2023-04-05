Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F36D8A89
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Apr 2023 00:27:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680733621;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=XK91TzLV+BuNFfVuafZ92bpnVCXIC7GzKLzoDgloMhQ=;
	b=Fdc8HyIXdMI/G+E5CjDBW+iLXhGxKijsvolwpl9j1KmRvXeEdeR2M+p3QzWifVc/LuSHp0
	DughqF7c8BCGSZQvKuY0deCwZ8E7ua2g4GGyyK5JOLwCbJAEDehkBMjR7SWOpusN2o7qC3
	/STrXK0QMZpJd9HEaFW8PFC5r33pe98=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-Ov2rLOq8ME-S9m6oWorXuw-1; Wed, 05 Apr 2023 18:26:55 -0400
X-MC-Unique: Ov2rLOq8ME-S9m6oWorXuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6785185A78B;
	Wed,  5 Apr 2023 22:26:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97289C1602C;
	Wed,  5 Apr 2023 22:26:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 680D81946597;
	Wed,  5 Apr 2023 22:26:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 142341946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 22:26:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 00CA7C158BB; Wed,  5 Apr 2023 22:26:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECBCBC158BA
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 22:26:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0128101A531
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 22:26:52 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-dofNtnDKOTOEDTLMB1kjxA-1; Wed, 05 Apr 2023 18:26:51 -0400
X-MC-Unique: dofNtnDKOTOEDTLMB1kjxA-1
Received: by mail-pg1-f169.google.com with SMTP id 184so8046635pga.12
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 15:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680733610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XK91TzLV+BuNFfVuafZ92bpnVCXIC7GzKLzoDgloMhQ=;
 b=G+m57pHsqqcgLAR29uspS9I/xob7vmVYV3WuiPsPAMd+iaf9T4ROZbt/nSiSJLRkjJ
 1mWNyNb3g9FI3dSN3mMc1814WfxUBDm1PiQCcUb6sX9qIPdh52SrmlOwiw4NTlKLff9j
 UcYAB0R4h+QnhSNfNsVtWL+BSAFhe93eEUyaRHI1Mhavb7ITFYt+7+iFs8AlJTgR/yxW
 k8TuVKhbEB6UAdxBgaondbGpJ1bdkr8aMC0xpW2KqkPYUcc27CbHtSPmWRXAkWxkQwDw
 hEezLTcMKCOmrGjUmje105amMepNbV/xdBqGF8akJFgp8oF0Dz8hUUMwE71Sj8J5PHmw
 3vOg==
X-Gm-Message-State: AAQBX9e7GFL7M7oiBgLdem5r4RpJJ1jojCo8K2PCBFj6h51YlrGZmujt
 MBeeyzTewgKBicskBhFKwbOFlfwX38Se8xns0FU=
X-Google-Smtp-Source: AKy350ZizTU3q/Uc2TiZy7crqeJ4jvK0CtSZoX/AzNtdP+Y2QHldAbm030UMhCShfo2v0Sb07Y+LGg==
X-Received: by 2002:a62:1d8f:0:b0:627:e577:4326 with SMTP id
 d137-20020a621d8f000000b00627e5774326mr6595721pfd.17.1680733610237; 
 Wed, 05 Apr 2023 15:26:50 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 2-20020aa79142000000b0062c0cfbb264sm11493110pfi.93.2023.04.05.15.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 15:26:49 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pkBaY-00HUjN-NL; Thu, 06 Apr 2023 08:26:46 +1000
Date: Thu, 6 Apr 2023 08:26:46 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230405222646.GR3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
 <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
 <20230405163847.GG303486@frogsfrogsfrogs>
 <ZC264FSkDQidOQ4N@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ZC264FSkDQidOQ4N@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v2 21/23] xfs: handle merkle tree block
 size != fs blocksize != PAGE_SIZE
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
 linux-ext4@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 06:16:00PM +0000, Eric Biggers wrote:
> On Wed, Apr 05, 2023 at 09:38:47AM -0700, Darrick J. Wong wrote:
> > > The merkle tree pages are dropped after verification. When page is
> > > dropped xfs_buf is marked as verified. If fs-verity wants to
> > > verify again it will get the same verified buffer. If buffer is
> > > evicted it won't have verified state.
> > > 
> > > So, with enough memory pressure buffers will be dropped and need to
> > > be reverified.
> > 
> > Please excuse me if this was discussed and rejected long ago, but
> > perhaps fsverity should try to hang on to the merkle tree pages that
> > this function returns for as long as possible until reclaim comes for
> > them?
> > 
> > With the merkle tree page lifetimes extended, you then don't need to
> > attach the xfs_buf to page->private, nor does xfs have to extend the
> > buffer cache to stash XBF_VERITY_CHECKED.
> 
> Well, all the other filesystems that support fsverity (ext4, f2fs, and btrfs)
> just cache the Merkle tree pages in the inode's page cache.  It's an approach
> that I know some people aren't a fan of, but it's efficient and it works.

Which puts pages beyond EOF in the page cache. Given that XFS also
allows persistent block allocation beyond EOF, having both data in the page
cache and blocks beyond EOF that contain unrelated information is a
Real Bad Idea.

Just because putting metadata in the file data address space works
for one filesystem, it doesn't me it's a good idea or that it works
for every filesystem.

> We could certainly think about moving to a design where fs/verity/ asks the
> filesystem to just *read* a Merkle tree block, without adding it to a cache, and
> then fs/verity/ implements the caching itself.  That would require some large
> changes to each filesystem, though, unless we were to double-cache the Merkle
> tree blocks which would be inefficient.

No, that's unnecessary.

All we need if for fsverity to require filesystems to pass it byte
addressable data buffers that are externally reference counted. The
filesystem can take a page reference before mapping the page and
passing the kaddr to fsverity, then unmap and drop the reference
when the merkle tree walk is done as per Andrey's new drop callout.

fsverity doesn't need to care what the buffer is made from, how it
is cached, what it's life cycle is, etc. The caching mechanism and
reference counting is entirely controlled by the filesystem callout
implementations, and fsverity only needs to deal with memory buffers
that are guaranteed to live for the entire walk of the merkle
tree....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

