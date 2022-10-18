Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 359E1603517
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Oct 2022 23:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666129566;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=rdhpXUGCkMu8VcqIxNAyDKuYCRrF5O3PB114YzTZo88=;
	b=ibGZ9rsKXFLQ+WBCThdn8WOZO6nAb0XY21eG3cG/1q+fVAvw2NV4UkAjgmwS5pEBXH5d+W
	nvfpROQa50XRrlUC0zMvS8qnARGa8M6RcfK9HoA0o3JGr62rCxnB5ZBKs9JtS0eBjb1j4m
	9DRiIjyEyzAP9ouhCWJf2t1G0nPhPhQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-BbocOGGQN92OZejpbeoxjA-1; Tue, 18 Oct 2022 17:46:00 -0400
X-MC-Unique: BbocOGGQN92OZejpbeoxjA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 441F1811E81;
	Tue, 18 Oct 2022 21:45:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F3BE42027062;
	Tue, 18 Oct 2022 21:45:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CAB5D1946597;
	Tue, 18 Oct 2022 21:45:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 13ECA194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 18 Oct 2022 21:45:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C93B3492B0F; Tue, 18 Oct 2022 21:45:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2096492B05
 for <cluster-devel@redhat.com>; Tue, 18 Oct 2022 21:45:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4FDD1C051AB
 for <cluster-devel@redhat.com>; Tue, 18 Oct 2022 21:45:52 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
 [211.29.132.249]) by relay.mimecast.com with ESMTP id
 us-mta-308-K5gHhD59PNKmeDxRMdMWPA-1; Tue, 18 Oct 2022 17:45:50 -0400
X-MC-Unique: K5gHhD59PNKmeDxRMdMWPA-1
Received: from dread.disaster.area (pa49-181-106-210.pa.nsw.optusnet.com.au
 [49.181.106.210])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 3E48911021F6;
 Wed, 19 Oct 2022 08:45:46 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1okuPA-003bsw-Bg; Wed, 19 Oct 2022 08:45:44 +1100
Date: Wed, 19 Oct 2022 08:45:44 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <20221018214544.GI2703033@dread.disaster.area>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220901220138.182896-1-vishal.moola@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=VuxAv86n c=1 sm=1 tr=0 ts=634f1e8b
 a=j6JUzzrSC7wlfFge/rmVbg==:117 a=j6JUzzrSC7wlfFge/rmVbg==:17
 a=kj9zAlcOel0A:10 a=Qawa6l4ZSaYA:10 a=7-415B0cAAAA:8
 a=A9Ajo3xi_aTsyj5e4eYA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 00/23] Convert to
 filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 01, 2022 at 03:01:15PM -0700, Vishal Moola (Oracle) wrote:
> This patch series replaces find_get_pages_range_tag() with
> filemap_get_folios_tag(). This also allows the removal of multiple
> calls to compound_head() throughout.
> It also makes a good chunk of the straightforward conversions to folios,
> and takes the opportunity to introduce a function that grabs a folio
> from the pagecache.
> 
> F2fs and Ceph have quite alot of work to be done regarding folios, so
> for now those patches only have the changes necessary for the removal of
> find_get_pages_range_tag(), and only support folios of size 1 (which is
> all they use right now anyways).
> 
> I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
> beneficial.

Well, that answers my question about how filesystems that enable
multi-page folios were tested: they weren't. 

I'd suggest that anyone working on further extending the
filemap/folio infrastructure really needs to be testing XFS as a
first priority, and then other filesystems as a secondary concern.

That's because XFS (via the fs/iomap infrastructure) is one of only
3 filesystems in the kernel (AFS and tmpfs are the others) that
interact with the page cache and page cache "pages" solely via folio
interfaces. As such they are able to support multi-page folios in
the page cache. All of the tested filesystems still use the fixed
PAGE_SIZE page interfaces to interact with the page cache, so they
don't actually exercise interactions with multi-page folios at all.

Hence if you are converting generic infrastructure that looks up
pages in the page cache to look up folios in the page cache, the
code that processes the returned folios also needs to be updated and
validated to ensure that it correctly handles multi-page folios. And
the only way you can do that fully at this point in time is via
testing XFS or AFS...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

