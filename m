Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E85D61BBAD1
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Apr 2020 12:09:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588068561;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7qxUAR6lqJsf32FrltGUCTkZOicn+Q2XMkEW8VoeWX8=;
	b=L5WEs3UegEe0BbksQNiQLXgA0OBxN6/xX7d1DkHtGrXX0lmmRN6aP+ecDm+eSborLuIhdS
	5mjwOIc/2MvWMwWgy9/4rivEDycFY4HiXK4f1v8NesjjfIX0YPJVlUfz+Agax9tSd/t+MK
	ErFX8QXfrnKVwml0Cy+vI/biOEiDqpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-n0zsW4uoOgqlYUwG-EFtBw-1; Tue, 28 Apr 2020 06:09:19 -0400
X-MC-Unique: n0zsW4uoOgqlYUwG-EFtBw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBC4B835B40;
	Tue, 28 Apr 2020 10:09:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE2EB5C1D4;
	Tue, 28 Apr 2020 10:09:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C05F74CAA0;
	Tue, 28 Apr 2020 10:09:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SA9Bil026045 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 06:09:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A1E51004024; Tue, 28 Apr 2020 10:09:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2514F100405D
	for <cluster-devel@redhat.com>; Tue, 28 Apr 2020 10:09:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DA111859171
	for <cluster-devel@redhat.com>; Tue, 28 Apr 2020 10:09:08 +0000 (UTC)
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
	[216.71.145.155]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-501-n_XhiqCxPKm1oM9l44SAgg-1; Tue, 28 Apr 2020 06:09:05 -0400
X-MC-Unique: n_XhiqCxPKm1oM9l44SAgg-1
IronPort-SDR: yJfMrKjn2SLkAG0PhZBkTaYiZzVxT1sWjP5zVFULlGKrYwVvo1czvuKv9N1Ui2F/6UOiJVt0Tf
	JUhso7wuJjmQOPMBpeJ6G40TCDL4NVZCEDe00ttmZ64VkBLVbs2bOfeXHJNuyqpnJPnigtIDtU
	NT9XNzzEGl8NKcfTT7izgMvRomnvOHsXA3rRoMprN5rLr4V//YfvSmKqzlssJglRsN1gnbFFlf
	jU61XDRHgQc1oUaALGDNW3ZPOhboQmFf3Pem2XeoEdQW/zqu6HkQnMDrVf7Q2MoCkoh31LUlB1
	zx0=
X-SBRS: 2.7
X-MesageID: 16342280
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,327,1583211600"; d="scan'208";a="16342280"
To: Bob Peterson <rpeterso@redhat.com>, cluster-devel
	<cluster-devel@redhat.com>
References: <20200424172456.616586-1-rpeterso@redhat.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <8f2635ed-d6ac-10c5-24c4-d90820d8a664@citrix.com>
Date: Tue, 28 Apr 2020 11:08:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200424172456.616586-1-rpeterso@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH 0/4] gfs2: misc withdraw patch fixes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 4/24/20 6:24 PM, Bob Peterson wrote:
> Hi,
> 
> Further recovery testing revealed some problems with the withdraw code,
> especially related to single-node (lock_nolock) withdraws. This patch set
> fixes some of the recent issues.
> 
> Bob Peterson (4):
>   gfs2: fix withdraw sequence deadlock
>   gfs2: Fix error exit in do_xmote
>   gfs2: Fix BUG during unmount after file system withdraw
>   gfs2: Fix use-after-free in gfs2_logd after withdraw
> 
>  fs/gfs2/glock.c   |  2 +-
>  fs/gfs2/log.c     |  5 +++++
>  fs/gfs2/meta_io.c |  2 +-
>  fs/gfs2/util.c    | 10 ++++++----
>  4 files changed, 13 insertions(+), 6 deletions(-)
> 

This patch series fixes the issue I reported last week regarding
the BUG during unmount and my testcase now passes.

Thanks!
-- 
Ross Lagerwall

