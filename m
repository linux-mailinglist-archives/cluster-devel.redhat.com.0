Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 364B61E88AF
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 22:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590783255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZR9Xg0JuwDsfJ5X+ub0HXfFIQ1lTykXlDmMoyCr06R8=;
	b=i6dT1s+e2PsVVci4AE7wnXcuTCbjtYxrqRTI1+SQmVxr2fwoCT4rKLaZST7trJEgHksB12
	an1ajWfrmdwXYlga2L6d82aWr2llB21dU1oicaqCWIVWwxhbEA/uQyqvwN3tmBlJm0qrWM
	h1+eUupLXo5vM0oeclzFpeAhw50cETc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-Ic9IC7JcNmqtK2PpSvvEiA-1; Fri, 29 May 2020 16:14:13 -0400
X-MC-Unique: Ic9IC7JcNmqtK2PpSvvEiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1184618A8222;
	Fri, 29 May 2020 20:14:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA3C260C87;
	Fri, 29 May 2020 20:14:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DC051809543;
	Fri, 29 May 2020 20:14:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TKBaYT015808 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 16:11:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8250B2026972; Fri, 29 May 2020 20:11:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B8BA2026971
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 20:11:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB7558007A4
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 20:11:33 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-153-EbAIZ1QnPrOxV4kSZCyWmg-1; Fri, 29 May 2020 16:11:31 -0400
X-MC-Unique: EbAIZ1QnPrOxV4kSZCyWmg-1
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 068FF12837646;
	Fri, 29 May 2020 13:11:28 -0700 (PDT)
Date: Fri, 29 May 2020 13:11:28 -0700 (PDT)
Message-Id: <20200529.131128.495042470763103913.davem@davemloft.net>
To: hch@lst.de
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200529120943.101454-1-hch@lst.de>
References: <20200529120943.101454-1-hch@lst.de>
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Fri, 29 May 2020 13:11:29 -0700 (PDT)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: marcelo.leitner@gmail.com, nhorman@tuxdriver.com, netdev@vger.kernel.org,
	vyasevich@gmail.com, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com, linux-sctp@vger.kernel.org,
	David.Laight@ACULAB.COM, kuba@kernel.org
Subject: Re: [Cluster-devel] remove kernel_setsockopt v4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

From: Christoph Hellwig <hch@lst.de>
Date: Fri, 29 May 2020 14:09:39 +0200

> now that only the dlm calls to sctp are left for kernel_setsockopt,
> while we haven't really made much progress with the sctp setsockopt
> refactoring, how about this small series that splits out a
> sctp_setsockopt_bindx_kernel that takes a kernel space address array
> to share more code as requested by Marcelo.  This should fit in with
> whatever variant of the refator of sctp setsockopt we go with, but
> just solved the immediate problem for now.
 ...

Series applied, thanks.

