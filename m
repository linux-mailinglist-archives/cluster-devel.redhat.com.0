Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A30822B08CD
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Nov 2020 16:48:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605196111;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zC4e4uH1A6eJFc7myOCJFJRQjNx5UmbHFI3Pi5iAZ2k=;
	b=SWdHNuvq1xiENFiFFuq4EXVAZ9yumFk/iQah76QbfChK4eNy2sueRe8cNCRrVknh68CL8I
	VADbjCB/YbwKUVm9b5dSC5hoRoD6XKULebslQgTj+JxV+a2Pf+SP+USxLnN8M5ypTdCIVf
	IDom6oQvJeyR/TRFfxE1PmOZDMytMF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-ssdATwAiMoGXkNAKeQZivQ-1; Thu, 12 Nov 2020 10:48:29 -0500
X-MC-Unique: ssdATwAiMoGXkNAKeQZivQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77E851882FC4;
	Thu, 12 Nov 2020 15:48:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47A3C6EF7D;
	Thu, 12 Nov 2020 15:48:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A515C5810C;
	Thu, 12 Nov 2020 15:48:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ACFj2f8028185 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Nov 2020 10:45:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 03DFB5B4A0; Thu, 12 Nov 2020 15:45:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2B3176642
	for <cluster-devel@redhat.com>; Thu, 12 Nov 2020 15:44:57 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD2F758100
	for <cluster-devel@redhat.com>; Thu, 12 Nov 2020 15:44:57 +0000 (UTC)
Date: Thu, 12 Nov 2020 10:44:55 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <2023985976.25677509.1605195895739.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201112145743.376789-1-rpeterso@redhat.com>
References: <20201112145743.376789-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.10, 10.4.195.8]
Thread-Topic: Fix regression in "Ignore journal log writes for jdata holes"
Thread-Index: h0KIJKsWQvVVkX8BFiUjwwDs79c56A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH 0/2] Fix regression in "Ignore
 journal	log writes for jdata holes"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Patch b2a846dbef4e ("gfs2: Ignore journal log writes for jdata holes"
> caused a regression. It fixed one specific problem while breaking others.
> The problem was that it changed the behavior of function gfs2_block_map
> which is used by multiple callers so it had unintended consequences for
> other callers.
> 
> This patch set reverts the patch and replaces it with a more targeted
> solution that fixes just the one case it needs to.
> 
> Bob Peterson (2):
>   Revert "gfs2: Ignore journal log writes for jdata holes"
>   gfs2: Make special version of gfs2_get_block_noalloc for jdata
> 
>  fs/gfs2/aops.c | 30 ++++++++++++++++++++++++++++--
>  fs/gfs2/bmap.c |  8 ++------
>  fs/gfs2/log.c  |  2 ++
>  3 files changed, 32 insertions(+), 8 deletions(-)
> 
> --
> 2.26.2

NACK. Ignore this for now. Something's wrong and I'm investigating.

Regards,

Bob Peterson

