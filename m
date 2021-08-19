Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 95EB13F1D5D
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Aug 2021 17:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629388535;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pmp4Kw5okIF5wwBbrjrJBs+O1tcqAHxdEgDPFxbvKOQ=;
	b=BhMHF8UyBj08/lEMGf6FFN2lYFgbO9PgBnrsLPfiSJhZMc4O79Fd1owz6B0rAkKGnpkBDB
	3G2eXi4NDkDhfg6sgQQGvK2H0d2if7ww8897C79Iq6OaLYd9cz8ojJTWCA1j7VgkPmxi+S
	+9F8Mymnqld40GuV19Ao43AS+9No1Ek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-atylZzuYPn-moS8Wgc-HcQ-1; Thu, 19 Aug 2021 11:55:34 -0400
X-MC-Unique: atylZzuYPn-moS8Wgc-HcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF771100A25B;
	Thu, 19 Aug 2021 15:55:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 052501970F;
	Thu, 19 Aug 2021 15:55:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6893181A3ED;
	Thu, 19 Aug 2021 15:55:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17JFtJM1026572 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Aug 2021 11:55:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D2142C00F; Thu, 19 Aug 2021 15:55:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (unknown [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7AF3421F;
	Thu, 19 Aug 2021 15:55:11 +0000 (UTC)
Date: Thu, 19 Aug 2021 10:55:09 -0500
From: David Teigland <teigland@redhat.com>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <20210819155509.GB21218@redhat.com>
References: <79f8d302-f53f-3891-965a-bcb460ab15ca@gmail.com>
MIME-Version: 1.0
In-Reply-To: <79f8d302-f53f-3891-965a-bcb460ab15ca@gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [BUG] fs: dlm: possible ABBA deadlock
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Aug 19, 2021 at 04:54:57PM +0800, Jia-Ju Bai wrote:
> Hello,
> 
> My static analysis tool reports a possible ABBA deadlock in the dlm
> filesystem in Linux 5.10:
> 
> dlm_recover_waiters_pre()
>   mutex_lock(&ls->ls_waiters_mutex); --> line 5130
>   recover_convert_waiter()
>     _receive_convert_reply()
>       lock_rsb()
>         mutex_lock(&r->res_mutex); --> line 69
> 
> dlm_recover_waiters_post()
>   lock_rsb()
>     mutex_lock(&r->res_mutex); --> line 69
>   mutex_lock(&ls->ls_waiters_mutex); --> line 5307
> 
> When dlm_recover_waiters_pre() and dlm_recover_waiters_post() are
> concurrently executed, the deadlock can occur.
> 
> I am not quite sure whether this possible deadlock is real and how to fix it
> if it is real.
> Any feedback would be appreciated, thanks :)

They won't be concurrent, "pre" runs before recovery, and "post" is after.
Dave

