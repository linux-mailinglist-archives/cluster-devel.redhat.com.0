Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4A76DB49A
	for <lists+cluster-devel@lfdr.de>; Fri,  7 Apr 2023 21:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680897412;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=L7nMWz4T8dPG2YqHE7NChcSp4hpglr9wYt0Ce31DYKY=;
	b=VJR+DGUJzH5fNd8jwC69rBmPT/0Lx0w75O0pNlbTd/6aRLh2OZIGl+v/vnmIsGg6uhIwYp
	6LplSdjSyNZIE8YHlUcRYhnxGJbmUQ4EDG1B8quc8YBBNwvsVGHo6QEgbRd0aRQqeE21I/
	4Lg41GAO4XGFBqcXkij0/DK7oP/VT0Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-hg5hDs03PJ-PaXSF8nM7TA-1; Fri, 07 Apr 2023 15:56:49 -0400
X-MC-Unique: hg5hDs03PJ-PaXSF8nM7TA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 706A18996E9;
	Fri,  7 Apr 2023 19:56:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6FC8440C83A9;
	Fri,  7 Apr 2023 19:56:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D42781946A40;
	Fri,  7 Apr 2023 19:56:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 86B7619465BB for <cluster-devel@listman.corp.redhat.com>;
 Fri,  7 Apr 2023 19:56:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5832C492C1B; Fri,  7 Apr 2023 19:56:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 500E9492C14
 for <cluster-devel@redhat.com>; Fri,  7 Apr 2023 19:56:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33C691C05ABE
 for <cluster-devel@redhat.com>; Fri,  7 Apr 2023 19:56:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-4Y-zJN_cPhCt1fMAGQsB2Q-1; Fri, 07 Apr 2023 15:56:39 -0400
X-MC-Unique: 4Y-zJN_cPhCt1fMAGQsB2Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B55B65160;
 Fri,  7 Apr 2023 19:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E35C433D2;
 Fri,  7 Apr 2023 19:56:37 +0000 (UTC)
Date: Fri, 7 Apr 2023 19:56:36 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <ZDB1dPVjon4Qthok@gmail.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
 <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
 <20230405163847.GG303486@frogsfrogsfrogs>
 <ZC264FSkDQidOQ4N@gmail.com>
 <20230405222646.GR3223426@dread.disaster.area>
 <ZC38DkQVPZBuZCZN@gmail.com>
 <20230405233753.GU3223426@dread.disaster.area>
 <20230406004434.GA879@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20230406004434.GA879@sol.localdomain>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 05:44:36PM -0700, Eric Biggers wrote:
> > Not vmalloc'ed, but vmapped. we allocate the pages individually, but
> > then call vm_map_page() to present the higher level code with a
> > single contiguous memory range if it is a multi-page buffer.
> > 
> > We do have the backing info held in the buffer, and that's what we
> > use for IO. If fsverity needs a page based scatter/gather list
> > for hardware offload, it could ask the filesystem to provide it
> > for that given buffer...
> > 
> > > BTW, converting fs/verity/ from ahash to shash is an option; I've really never
> > > been a fan of the scatterlist-based crypto APIs!  The disadvantage of doing
> > > this, though, would be that it would remove support for all the hardware crypto
> > > drivers.
> > >
> > > That *might* actually be okay, as that approach to crypto acceleration
> > > has mostly fallen out of favor, in favor of CPU-based acceleration.  But I do
> > > worry about e.g. someone coming out of the woodwork and saying they need to use
> > > fsverity on a low-powered ARM board that has a crypto accelerator like CAAM, and
> > > they MUST use their crypto accelerator to get acceptable performance.
> > 
> > True, but we are very unlikely to be using XFS on such small
> > systems and I don't think we really care about XFS performance on
> > android sized systems, either.
> > 
> 
> FYI, I've sent an RFC patch that converts fs/verity/ from ahash to shash:
> https://lore.kernel.org/r/20230406003714.94580-1-ebiggers@kernel.org
> 
> It would be great if we could do that.  But I need to get a better sense for
> whether anyone will complain...

FWIW, dm-verity went in the other direction.  It started with shash, and then in
2017 it was switched to ahash by https://git.kernel.org/linus/d1ac3ff008fb9a48
("dm verity: switch to using asynchronous hash crypto API").

I think that was part of my motivation for using ahash in fsverity from the
beginning.

Still, it does seem that ahash is more trouble than it's worth these days...

- Eric

