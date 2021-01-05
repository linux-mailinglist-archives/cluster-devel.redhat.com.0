Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D08B52EAB43
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Jan 2021 13:54:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609851292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kkaRfLQqH0U8BvET7tQ/CKyv+rk+rxXC9tFuL3Sdp/s=;
	b=FbUONjfPI89RXazAouWs2G/9A+pg/daQIyQQ5YF3WCqXnAxInf7FSYiLRZG17InDTLPFML
	PU4s0wN8BJ3h04AjkJT8z8aj8nTz++YQM326YsGDmm2DnnAOCsc7gEa2bB/b8qy4nI5e4q
	RPcYz9Ntw15wwKu+MQlerug1vcjDM9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-jsivrrfmNcSjKsJDgliL0A-1; Tue, 05 Jan 2021 07:54:51 -0500
X-MC-Unique: jsivrrfmNcSjKsJDgliL0A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70989107ACE4;
	Tue,  5 Jan 2021 12:54:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE64F19C46;
	Tue,  5 Jan 2021 12:54:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABB5A1809C9F;
	Tue,  5 Jan 2021 12:54:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 105Csebh001718 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 5 Jan 2021 07:54:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 93F1B57; Tue,  5 Jan 2021 12:54:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5985C1C2;
	Tue,  5 Jan 2021 12:54:37 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DC4718095C7;
	Tue,  5 Jan 2021 12:54:37 +0000 (UTC)
Date: Tue, 5 Jan 2021 07:54:34 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Huangzhaoyang <huangzhaoyang@gmail.com>
Message-ID: <1535117686.42500348.1609851274846.JavaMail.zimbra@redhat.com>
In-Reply-To: <1609807642-31552-1-git-send-email-huangzhaoyang@gmail.com>
References: <1609807642-31552-1-git-send-email-huangzhaoyang@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.28, 10.4.195.12]
Thread-Topic: amend SLAB_RECLAIM_ACCOUNT on gfs2 related slab cache
Thread-Index: ebnfMPn3ZtGLtG6ofpW+am73oZGEhw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Subject: Re: [Cluster-devel] [PATCH v2] fs: amend SLAB_RECLAIM_ACCOUNT on
 gfs2 related slab cache
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> 
> As gfs2_quotad_cachep and gfs2_glock_cachep have registered
> the shrinker, amending SLAB_RECLAIM_ACCOUNT when creating
> them, which make the slab acount to be presiced.
> 
> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> ---
> v2: add gfs2_glock_cachep for same operation
> ---
Hi,

Thanks. Your patch is now pushed to the linux-gfs2/for-next branch.
I cleaned up the description a bit. For example, I changed "fs:" to
"gfs2:" to conform to other gfs2 patches.

Regards,

Bob Peterson

