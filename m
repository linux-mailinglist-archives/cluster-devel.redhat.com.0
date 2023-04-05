Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A596F6D8B27
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Apr 2023 01:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680737890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KeGD4MyOApqEcxE+Vz2Xa5S1sUVL6ion9IBrFVNam5c=;
	b=P1d2a0NDJYeyc9iiYg4XGpyIuT+z2Wsegh7A/7ZJRq7Jt9FeFLXQ4xuRy1CIvEzZMYFxAG
	4scBvgHjrp+hQTGqDIcI1rfNCX49I+Mb/r0Tj8W1MquCpmRmDJY/aM+odNOl5WFgHUDEmA
	RZ2zMJD7S36ZwIseHRk4n1aq25fShAY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-fqm0DoncMV22Og6S7B_POA-1; Wed, 05 Apr 2023 19:38:07 -0400
X-MC-Unique: fqm0DoncMV22Og6S7B_POA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7433C299E756;
	Wed,  5 Apr 2023 23:38:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E0AD140EBF4;
	Wed,  5 Apr 2023 23:38:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA7031946597;
	Wed,  5 Apr 2023 23:38:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5EC891946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 23:38:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F1BBBC3599A; Wed,  5 Apr 2023 23:38:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA1F0C35999
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 23:38:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C936C800B23
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 23:38:02 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-JNwimca1MfinALtnigxNRg-1; Wed, 05 Apr 2023 19:37:59 -0400
X-MC-Unique: JNwimca1MfinALtnigxNRg-1
Received: by mail-pl1-f174.google.com with SMTP id kc4so35891052plb.10
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 16:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680737878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KeGD4MyOApqEcxE+Vz2Xa5S1sUVL6ion9IBrFVNam5c=;
 b=gJbQQfG9iimd0EIpFnTmyh5VMNEj8PZL7+iNIgv5MkBI5gJ24vr9X0W+kaY6mFEDts
 3AnFOYAgJPk7+nHYGzbMSz8qTQDHMqzELoEF5AXbMzB9+b31F33C1MsmQLIyv23FGJL1
 EoLSR2gZprLyiZ65Z1rjE8zyjctyW8G1cGiBDlacBt7PCZeNOESqYmOf85umkMFXVd18
 wrFny/YM7vtye1BWFsVC0m+FfqCNjW6pFsFW9FgD2gt4kZ8UfB9K8uRClK7sQHHEmVAw
 2gqsn8l8+6WAQRasdDI85juH0Um0t/2pD7gTytM0A1CI9gVBOJBEUhKNvyFtvQWQ61d9
 vXXg==
X-Gm-Message-State: AAQBX9eY5uTnZ4plZMWQaWrxRH9cBAl8hFEsSXvmA1Jnddy/uvCaFAC+
 JTEfp4E2a+dgHrjXmXz1BnCgsg==
X-Google-Smtp-Source: AKy350YPpczm2kLshRHm378imxeqOrGuMhMZKLP5TqBhKu/vDXjqcxQbAmKQSkLGeQMyYt/kagueXA==
X-Received: by 2002:a05:6a20:bc96:b0:d9:18ab:16be with SMTP id
 fx22-20020a056a20bc9600b000d918ab16bemr883843pzb.29.1680737878121; 
 Wed, 05 Apr 2023 16:37:58 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 m37-20020a635825000000b00502dc899394sm9641716pgb.66.2023.04.05.16.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 16:37:57 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pkChN-00HVv9-Mh; Thu, 06 Apr 2023 09:37:53 +1000
Date: Thu, 6 Apr 2023 09:37:53 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230405233753.GU3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
 <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
 <20230405163847.GG303486@frogsfrogsfrogs>
 <ZC264FSkDQidOQ4N@gmail.com>
 <20230405222646.GR3223426@dread.disaster.area>
 <ZC38DkQVPZBuZCZN@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ZC38DkQVPZBuZCZN@gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 10:54:06PM +0000, Eric Biggers wrote:
> On Thu, Apr 06, 2023 at 08:26:46AM +1000, Dave Chinner wrote:
> > > We could certainly think about moving to a design where fs/verity/ asks the
> > > filesystem to just *read* a Merkle tree block, without adding it to a cache, and
> > > then fs/verity/ implements the caching itself.  That would require some large
> > > changes to each filesystem, though, unless we were to double-cache the Merkle
> > > tree blocks which would be inefficient.
> > 
> > No, that's unnecessary.
> > 
> > All we need if for fsverity to require filesystems to pass it byte
> > addressable data buffers that are externally reference counted. The
> > filesystem can take a page reference before mapping the page and
> > passing the kaddr to fsverity, then unmap and drop the reference
> > when the merkle tree walk is done as per Andrey's new drop callout.
> > 
> > fsverity doesn't need to care what the buffer is made from, how it
> > is cached, what it's life cycle is, etc. The caching mechanism and
> > reference counting is entirely controlled by the filesystem callout
> > implementations, and fsverity only needs to deal with memory buffers
> > that are guaranteed to live for the entire walk of the merkle
> > tree....
> 
> Sure.  Just a couple notes:
> 
> First, fs/verity/ does still need to be able to tell whether the buffer is newly
> instantiated or not.

Boolean flag from the caller.

> Second, fs/verity/ uses the ahash API to do the hashing.  ahash is a
> scatterlist-based API.  Virtual addresses can still be used (see sg_set_buf()),
> but the memory cannot be vmalloc'ed memory, since virt_to_page() needs to work.
> Does XFS use vmalloc'ed memory for these buffers?

Not vmalloc'ed, but vmapped. we allocate the pages individually, but
then call vm_map_page() to present the higher level code with a
single contiguous memory range if it is a multi-page buffer.

We do have the backing info held in the buffer, and that's what we
use for IO. If fsverity needs a page based scatter/gather list
for hardware offload, it could ask the filesystem to provide it
for that given buffer...

> BTW, converting fs/verity/ from ahash to shash is an option; I've really never
> been a fan of the scatterlist-based crypto APIs!  The disadvantage of doing
> this, though, would be that it would remove support for all the hardware crypto
> drivers.
>
> That *might* actually be okay, as that approach to crypto acceleration
> has mostly fallen out of favor, in favor of CPU-based acceleration.  But I do
> worry about e.g. someone coming out of the woodwork and saying they need to use
> fsverity on a low-powered ARM board that has a crypto accelerator like CAAM, and
> they MUST use their crypto accelerator to get acceptable performance.

True, but we are very unlikely to be using XFS on such small
systems and I don't think we really care about XFS performance on
android sized systems, either.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

