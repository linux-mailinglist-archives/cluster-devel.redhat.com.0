Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 527DE336E77
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Mar 2021 10:09:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615453761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yPB4EPv1/p6+5tjNKhsVhS/zQzrtEzdHtMJ25JFlzl0=;
	b=eZlw+i6vY5eOGfHX+6bCt78gRRJGDJ0zcxFhWYZonD7m3o+DZX6CRJtxM3QnwXQQW3+tBD
	fWFurdbu8Mj0SOCBaLXANFf/TuYwRVWuvHt3L2oSAp28Uu0IT+Jb8W6VFcer3KkVmZpe7V
	oejiUKTN3ovzlPkR2ZS2EBwRwWe8tPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-eCv64bJmMwatjw4mAWLtwg-1; Thu, 11 Mar 2021 04:09:19 -0500
X-MC-Unique: eCv64bJmMwatjw4mAWLtwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECB67871377;
	Thu, 11 Mar 2021 09:09:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C8BA60C66;
	Thu, 11 Mar 2021 09:09:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A8AF3805;
	Thu, 11 Mar 2021 09:09:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12B99538012230 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 11 Mar 2021 04:09:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6BA5B60243; Thu, 11 Mar 2021 09:09:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from ovpn-113-204.ams2.redhat.com (ovpn-113-204.ams2.redhat.com
	[10.36.113.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D024260C66;
	Thu, 11 Mar 2021 09:09:00 +0000 (UTC)
Message-ID: <7536fa5a3661675c583a448cf1bbc3f026bfea23.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Alexander Aring <aahringo@redhat.com>, teigland@redhat.com
Date: Thu, 11 Mar 2021 10:08:59 +0100
In-Reply-To: <20210310191745.80824-1-aahringo@redhat.com>
References: <20210310191745.80824-1-aahringo@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com
Subject: Re: [Cluster-devel] [PATCHv2 dlm/next 0/8] fs: dlm: introduce dlm
 re-transmission layer
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

Thank you for the new version.

On Wed, 2021-03-10 at 14:17 -0500, Alexander Aring wrote:
> this is the final patch-series to make dlm reliable when re-connection
> occurs. You can easily generate a couple of re-connections by running:
> 
> tcpkill -9 -i $IFACE port 21064
> 
> on your own to test these patches. At some time dlm will detect message
> drops and will re-transmit messages if necessary. It introduces a new dlm
> protocol behaviour and increases the dlm protocol version. I tested it
> with SCTP as well and tried to be backwards compatible with dlm protocol
> version 3.1. However I don't recommend at all to mix these versions
> in a setup since dlm version 3.2 fixes long-term issues.
> 
> - Alex
> 
> changes since v2:
>  - make timer handling pending only if messages are on air, the sync
>    isn't quite correct there but doesn't need to be precise
>  - use before() from tcp to check if seq is before other seq with
>    respect of overflows
>  - change srcu handling to hold srcu in all places where nodes are
>    referencing - we should not get a disadvantage of holding that
>    lock. We should update also lowcomms regarding to that.
>  - add some WARN_ON() to check that nothing in send/recv is going
>    anymore otherwise it's likely an issue.
>  - add more future work regarding to fencing of nodes if over
>    cluster manager timeout/bad seq happens
>  - add note about missing length size check of tail payload
>    (resource name length) regarding to the receive buffer
>  - remove some include which isn't necessary in recoverd.c

I plan/hope to go through this iteration at the very end of this week
or early next one.

I just noticed that some email from you targeting netdev landed in my
spam folder thanks to our corporate anti-spam filter. So I possibly
lost some replies from you. If you already answered the following, I'm
sorry I lost that but it's not my fault! Please kindly resend the
message ;)

The relevant questions was/are:

- is there git tree avail with all the series applied, to help with the
review?
- DEFAULT_BUFFER_SIZE == LOWCOMMS_MAX_TX_BUFFER_LEN in current net-
next, so looks like a change below is actually a no op ?!?
- Could you please add more info WRT the reference to unaligned memory
access in the code comments? Which field[s] is[are] subject to that?

Thanks!

Paolo


