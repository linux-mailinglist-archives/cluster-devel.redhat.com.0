Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BF0583CFE
	for <lists+cluster-devel@lfdr.de>; Thu, 28 Jul 2022 13:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659007084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Ch7OpJ9togQrcIvktUHsyLTlf/K2VFQcctastF2/ugA=;
	b=W+31mAtQZPvG78h317a2CVsAo+Gl12qdWnW/aRaGIGp9wRef35tIAL7bkWqrvoZ7yMibCx
	7slspuBnIPQMQjnQP2E4618nYClYeL+CN8YPGH0vH4MD6vasLZF/1UWrW5GtBfhPMqGvIm
	I5rpOdT2lqgEQzUxKl45anY1swnFYnM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-a0MboYZiPCWRSXmgK0M6gw-1; Thu, 28 Jul 2022 07:18:00 -0400
X-MC-Unique: a0MboYZiPCWRSXmgK0M6gw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBA78811E7A;
	Thu, 28 Jul 2022 11:17:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 108971415121;
	Thu, 28 Jul 2022 11:17:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A59ED1945DAD;
	Thu, 28 Jul 2022 11:17:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0CD961945DA7 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 28 Jul 2022 11:17:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E1D35492CA2; Thu, 28 Jul 2022 11:17:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD592492CA5
 for <cluster-devel@redhat.com>; Thu, 28 Jul 2022 11:17:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4091803FFA
 for <cluster-devel@redhat.com>; Thu, 28 Jul 2022 11:17:55 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-FTPfAtEWOLOrcQtchk29Tg-1; Thu, 28 Jul 2022 07:17:54 -0400
X-MC-Unique: FTPfAtEWOLOrcQtchk29Tg-1
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4205F20767;
 Thu, 28 Jul 2022 11:10:18 +0000 (UTC)
Received: from quack3.suse.cz (unknown [10.163.43.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 97F522C141;
 Thu, 28 Jul 2022 11:10:17 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 4F4C9A0668; Thu, 28 Jul 2022 13:10:16 +0200 (CEST)
Date: Thu, 28 Jul 2022 13:10:16 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20220728111016.uwbaywprzkzne7ib@quack3>
References: <20220719041311.709250-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220719041311.709250-1-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Cluster-devel] remove iomap_writepage v2
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
 Johannes Thumshirn <jth@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph!

On Tue 19-07-22 06:13:07, Christoph Hellwig wrote:
> this series removes iomap_writepage and it's callers, following what xfs
> has been doing for a long time.

So this effectively means "no writeback from page reclaim for these
filesystems" AFAICT (page migration of dirty pages seems to be handled by
iomap_migrate_page()) which is going to make life somewhat harder for
memory reclaim when memory pressure is high enough that dirty pages are
reaching end of the LRU list. I don't expect this to be a problem on big
machines but it could have some undesirable effects for small ones
(embedded, small VMs). I agree per-page writeback has been a bad idea for
efficiency reasons for at least last 10-15 years and most filesystems
stopped dealing with more complex situations (like block allocation) from
->writepage() already quite a few years ago without any bug reports AFAIK.
So it all seems like a sensible idea from FS POV but are MM people on board
or at least aware of this movement in the fs land?

Added a few CC's for that.

								Honza

> Changes since v1:
>  - clean up a printk in gfs2
> 
> Diffstat:
>  fs/gfs2/aops.c         |   26 --------------------------
>  fs/gfs2/log.c          |    5 ++---
>  fs/iomap/buffered-io.c |   15 ---------------
>  fs/zonefs/super.c      |    8 --------
>  include/linux/iomap.h  |    3 ---
>  5 files changed, 2 insertions(+), 55 deletions(-)
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

