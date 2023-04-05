Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F61F6D85CA
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 20:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680718578;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nMGdYZVz88iNnPqnJrvWnqcw1Ql+5T1kzULIEIbApDk=;
	b=W9+1xQ0F9McgAPyC0JHOid9d/gTPGMyQ0xK/Ng2DbFgHA16RvWDWVnxedpUhQxv10uytup
	K4Z91zmgT8ThQ2BBTZ9eQotRMVYeNo7Rb7XbsiKDqEVhVBvrQ8hjlCJN/J0dGBrf08CyBT
	XGef76lRn42b2vWqwSqrxadh//BmgVA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-nA_MnAtXO6yskqkwcKyszg-1; Wed, 05 Apr 2023 14:16:13 -0400
X-MC-Unique: nA_MnAtXO6yskqkwcKyszg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78B9A3C02549;
	Wed,  5 Apr 2023 18:16:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29CE71121315;
	Wed,  5 Apr 2023 18:16:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DF0F91946597;
	Wed,  5 Apr 2023 18:16:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 289591946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 18:16:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A70042166B29; Wed,  5 Apr 2023 18:16:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F63A2166B26
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 18:16:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F27C3C02530
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 18:16:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-xrr4cDJ1NROm-lPH_0ZPow-1; Wed, 05 Apr 2023 14:16:03 -0400
X-MC-Unique: xrr4cDJ1NROm-lPH_0ZPow-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4EC7B63D3A;
 Wed,  5 Apr 2023 18:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710CAC433EF;
 Wed,  5 Apr 2023 18:16:01 +0000 (UTC)
Date: Wed, 5 Apr 2023 18:16:00 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <ZC264FSkDQidOQ4N@gmail.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
 <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
 <20230405163847.GG303486@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230405163847.GG303486@frogsfrogsfrogs>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
 linux-ext4@vger.kernel.org, Andrey Albershteyn <aalbersh@redhat.com>,
 chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, damien.lemoal@opensource.wdc.com,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 09:38:47AM -0700, Darrick J. Wong wrote:
> > The merkle tree pages are dropped after verification. When page is
> > dropped xfs_buf is marked as verified. If fs-verity wants to
> > verify again it will get the same verified buffer. If buffer is
> > evicted it won't have verified state.
> > 
> > So, with enough memory pressure buffers will be dropped and need to
> > be reverified.
> 
> Please excuse me if this was discussed and rejected long ago, but
> perhaps fsverity should try to hang on to the merkle tree pages that
> this function returns for as long as possible until reclaim comes for
> them?
> 
> With the merkle tree page lifetimes extended, you then don't need to
> attach the xfs_buf to page->private, nor does xfs have to extend the
> buffer cache to stash XBF_VERITY_CHECKED.

Well, all the other filesystems that support fsverity (ext4, f2fs, and btrfs)
just cache the Merkle tree pages in the inode's page cache.  It's an approach
that I know some people aren't a fan of, but it's efficient and it works.

We could certainly think about moving to a design where fs/verity/ asks the
filesystem to just *read* a Merkle tree block, without adding it to a cache, and
then fs/verity/ implements the caching itself.  That would require some large
changes to each filesystem, though, unless we were to double-cache the Merkle
tree blocks which would be inefficient.

So it feels like continuing to have the filesystem (not fs/verity/) be
responsible for the cache is the best way to allow XFS to do things a bit
differently, without regressing the other filesystems.

I'm interested in hearing any other proposals, though.

- Eric

