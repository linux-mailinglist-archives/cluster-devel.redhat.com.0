Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE366D827C
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 17:48:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680709711;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0N3bnEoqyxD9JBa9a3Jw/h398bdzAlmE4MCZrbnnAyo=;
	b=chzqb74j0m9hWrkgYJ1eczMIV758ghtkY/yY5C8fPTMByhC+31lenbNqa8sTybHBt3YNxA
	nDBp8IL3UOAh0FdqmpsD3m5CzR4L3/ijl+4laI5/BzqIM1Zxjy1PcwApaA1WDmd5UDh4Y/
	X3P+AlUMWutPXqPdYgPUwpfnL/8gCVY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-kThNEkm1Ocuq3T4ImMLPSQ-1; Wed, 05 Apr 2023 11:48:26 -0400
X-MC-Unique: kThNEkm1Ocuq3T4ImMLPSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E1683C0ED6F;
	Wed,  5 Apr 2023 15:48:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A61FC440BC;
	Wed,  5 Apr 2023 15:48:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 49AD01946597;
	Wed,  5 Apr 2023 15:48:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B245B1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 15:48:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 937FF4020C80; Wed,  5 Apr 2023 15:48:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B3F640C6EC4
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 15:48:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26E2338149B0
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 15:48:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-ciXDqDwwMNWGinCBFXmdGA-1; Wed, 05 Apr 2023 11:48:20 -0400
X-MC-Unique: ciXDqDwwMNWGinCBFXmdGA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pk5Mv-004zVF-1j; Wed, 05 Apr 2023 15:48:17 +0000
Date: Wed, 5 Apr 2023 08:48:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <ZC2YQalRTGxzmNDK@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-10-aalbersh@redhat.com>
 <ZCxEHkWayQyGqnxL@infradead.org>
 <20230405110116.ia5wv3qxbnpdciui@aalbersh.remote.csb>
 <20230405150627.GC303486@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230405150627.GC303486@frogsfrogsfrogs>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 09/23] iomap: allow filesystem to
 implement read path verification
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
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org, jth@kernel.org,
 linux-ext4@vger.kernel.org, Andrey Albershteyn <aalbersh@redhat.com>,
 chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, xiang@kernel.org, damien.lemoal@opensource.wdc.com,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 08:06:27AM -0700, Darrick J. Wong wrote:
> > > I wonder if that also makes sense and keep all the deferral in the
> > > file system.  We'll need that for the btrfs iomap conversion anyway,
> > > and it seems more flexible.  The ioend processing would then move into
> > > XFS.
> > > 
> > 
> > Not sure what you mean here.
> 
> I /think/ Christoph is talking about allowing callers of iomap pagecache
> operations to supply a custom submit_bio function and a bio_set so that
> filesystems can add in their own post-IO processing and appropriately
> sized (read: minimum you can get away with) bios.  I imagine btrfs has
> quite a lot of (read) ioend processing they need to do, as will xfs now
> that you're adding fsverity.

Exactly.

> I think the point is that this is a general "check what we just read"
> hook, so it could be in readpage_ops since we're never going to need to
> re-validate verity contents, right?  Hence it could be in readpage_ops
> instead of the general iomap_folio_ops.
> 
> <shrug> Is there a use case for ->verify_folio that isn't a read post-
> processing step?

Yes.  In fact I wonder if the verification might actually be done
in the per-bio end_io handler in the file system.  But I'll need
to find some more time to read through the XFS parts of series to
come up with a more intelligent suggestion on that.

