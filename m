Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC30D367FC6
	for <lists+cluster-devel@lfdr.de>; Thu, 22 Apr 2021 13:47:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-8UCxBKZTMMehEP20vczXvQ-1; Thu, 22 Apr 2021 07:47:02 -0400
X-MC-Unique: 8UCxBKZTMMehEP20vczXvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B37B86D25D;
	Thu, 22 Apr 2021 11:46:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BB556025A;
	Thu, 22 Apr 2021 11:46:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CEFF44A5B;
	Thu, 22 Apr 2021 11:46:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13MBhrrg016021 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 22 Apr 2021 07:43:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AEF3310AF9D5; Thu, 22 Apr 2021 11:43:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB63810AF9C6
	for <cluster-devel@redhat.com>; Thu, 22 Apr 2021 11:43:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC948104D9A8
	for <cluster-devel@redhat.com>; Thu, 22 Apr 2021 11:43:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-563-8ZNcOVaXPaiirtSA87JTQg-1;
	Thu, 22 Apr 2021 07:43:40 -0400
X-MC-Unique: 8ZNcOVaXPaiirtSA87JTQg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 90D6DAE58;
	Thu, 22 Apr 2021 11:26:12 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 62EA91E37A2; Thu, 22 Apr 2021 13:26:12 +0200 (CEST)
Date: Thu, 22 Apr 2021 13:26:12 +0200
From: Jan Kara <jack@suse.cz>
To: Bob Peterson <rpeterso@redhat.com>
Message-ID: <20210422112612.GF26221@quack2.suse.cz>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org
Subject: [Cluster-devel] Hole punch races in GFS2
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I am looking into how GFS2 protects against races between hole punching and
things like page fault or readahead and AFAICT it seems it does not. In
particular is there anything that protects against a race like:

CPU1					CPU2
gfs2_fallocate()
  __gfs2_punch_hole()
    truncate_pagecache_range()
					gfs2_fault()
					  - faults in old data into page
					    cache
    punch_hole()

And now we have stale data in the page cache (data corruption). If
gfs2_page_mkwrite() sneaked in that window as well, we might be even racing
with writeback and are possibly corrupting the filesystem on disk. Is there
anything I'm missing?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

