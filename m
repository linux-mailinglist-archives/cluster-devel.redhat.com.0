Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A376D8C20
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Apr 2023 02:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680741889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=r8gbq9A+CVL6lExX2DdX2+SHU8p7UjFjmZ1IdBn1rhg=;
	b=ffqpoWtmuWJnRje2lfCZd/xPsG9EJB8D8PqhnqJ11LHUZoQT1+KG9JNQyIqNI3nURzYpAq
	TuAWtOkfXFj8Roi+qttFto+PFxPChLTwCRqsdBXRNeVtEl8ODKKlZpwILuuUmGOmzrsH4T
	NOCTal/bj8QVZ9VOYtjIb2kQ22y4F3c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-vQv0R7hEPZCOubS-DzDsEQ-1; Wed, 05 Apr 2023 20:44:46 -0400
X-MC-Unique: vQv0R7hEPZCOubS-DzDsEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A670685C06B;
	Thu,  6 Apr 2023 00:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 695D21121314;
	Thu,  6 Apr 2023 00:44:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1369F1946597;
	Thu,  6 Apr 2023 00:44:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 61D181946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Apr 2023 00:44:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0A9BCC15E7F; Thu,  6 Apr 2023 00:44:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0202FC158BA
 for <cluster-devel@redhat.com>; Thu,  6 Apr 2023 00:44:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D741B85A588
 for <cluster-devel@redhat.com>; Thu,  6 Apr 2023 00:44:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-sJZXCzmbNgyNuoIUZyKmrA-1; Wed, 05 Apr 2023 20:44:38 -0400
X-MC-Unique: sJZXCzmbNgyNuoIUZyKmrA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 422DD62A45;
 Thu,  6 Apr 2023 00:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21089C433D2;
 Thu,  6 Apr 2023 00:44:36 +0000 (UTC)
Date: Wed, 5 Apr 2023 17:44:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20230406004434.GA879@sol.localdomain>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
 <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
 <20230405163847.GG303486@frogsfrogsfrogs>
 <ZC264FSkDQidOQ4N@gmail.com>
 <20230405222646.GR3223426@dread.disaster.area>
 <ZC38DkQVPZBuZCZN@gmail.com>
 <20230405233753.GU3223426@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20230405233753.GU3223426@dread.disaster.area>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 06, 2023 at 09:37:53AM +1000, Dave Chinner wrote:
> On Wed, Apr 05, 2023 at 10:54:06PM +0000, Eric Biggers wrote:
> > On Thu, Apr 06, 2023 at 08:26:46AM +1000, Dave Chinner wrote:
> > > > We could certainly think about moving to a design where fs/verity/ asks the
> > > > filesystem to just *read* a Merkle tree block, without adding it to a cache, and
> > > > then fs/verity/ implements the caching itself.  That would require some large
> > > > changes to each filesystem, though, unless we were to double-cache the Merkle
> > > > tree blocks which would be inefficient.
> > > 
> > > No, that's unnecessary.
> > > 
> > > All we need if for fsverity to require filesystems to pass it byte
> > > addressable data buffers that are externally reference counted. The
> > > filesystem can take a page reference before mapping the page and
> > > passing the kaddr to fsverity, then unmap and drop the reference
> > > when the merkle tree walk is done as per Andrey's new drop callout.
> > > 
> > > fsverity doesn't need to care what the buffer is made from, how it
> > > is cached, what it's life cycle is, etc. The caching mechanism and
> > > reference counting is entirely controlled by the filesystem callout
> > > implementations, and fsverity only needs to deal with memory buffers
> > > that are guaranteed to live for the entire walk of the merkle
> > > tree....
> > 
> > Sure.  Just a couple notes:
> > 
> > First, fs/verity/ does still need to be able to tell whether the buffer is newly
> > instantiated or not.
> 
> Boolean flag from the caller.
> 
> > Second, fs/verity/ uses the ahash API to do the hashing.  ahash is a
> > scatterlist-based API.  Virtual addresses can still be used (see sg_set_buf()),
> > but the memory cannot be vmalloc'ed memory, since virt_to_page() needs to work.
> > Does XFS use vmalloc'ed memory for these buffers?
> 
> Not vmalloc'ed, but vmapped. we allocate the pages individually, but
> then call vm_map_page() to present the higher level code with a
> single contiguous memory range if it is a multi-page buffer.
> 
> We do have the backing info held in the buffer, and that's what we
> use for IO. If fsverity needs a page based scatter/gather list
> for hardware offload, it could ask the filesystem to provide it
> for that given buffer...
> 
> > BTW, converting fs/verity/ from ahash to shash is an option; I've really never
> > been a fan of the scatterlist-based crypto APIs!  The disadvantage of doing
> > this, though, would be that it would remove support for all the hardware crypto
> > drivers.
> >
> > That *might* actually be okay, as that approach to crypto acceleration
> > has mostly fallen out of favor, in favor of CPU-based acceleration.  But I do
> > worry about e.g. someone coming out of the woodwork and saying they need to use
> > fsverity on a low-powered ARM board that has a crypto accelerator like CAAM, and
> > they MUST use their crypto accelerator to get acceptable performance.
> 
> True, but we are very unlikely to be using XFS on such small
> systems and I don't think we really care about XFS performance on
> android sized systems, either.
> 

FYI, I've sent an RFC patch that converts fs/verity/ from ahash to shash:
https://lore.kernel.org/r/20230406003714.94580-1-ebiggers@kernel.org

It would be great if we could do that.  But I need to get a better sense for
whether anyone will complain...

- Eric

