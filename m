Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id ECFEB1E5104
	for <lists+cluster-devel@lfdr.de>; Thu, 28 May 2020 00:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590617533;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nYkbrwANAzaAearrg9LJlrrHmzxl1JWdd9Q8s3sC93Y=;
	b=N1scR+/TAkHN3uFu+jVnPb8Hnjbo9LxTA6JBwFGldT2+mBbOLKLYH8ZgbQWh+7dLN05QsR
	8GUTwvGv2tF39GbWn/M6vWDxq0JFn2DbGVppaRFJVzPBM4kA94Q6PE+zspMfUxymmNTu7k
	v/Ps0ZbCi6ywwj9OHlVQrpd8Laarb/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-8DGN_8FvMXycLjIGD-nrHQ-1; Wed, 27 May 2020 18:12:11 -0400
X-MC-Unique: 8DGN_8FvMXycLjIGD-nrHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1E18107ACCD;
	Wed, 27 May 2020 22:12:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34E45747BF;
	Wed, 27 May 2020 22:12:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDE333E1E0;
	Wed, 27 May 2020 22:12:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RMBxsZ016068 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 18:11:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0249CD29D8; Wed, 27 May 2020 22:11:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF020D29D9
	for <cluster-devel@redhat.com>; Wed, 27 May 2020 22:11:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BBD880CDAE
	for <cluster-devel@redhat.com>; Wed, 27 May 2020 22:11:56 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-43-L0nVD412MHaEGKgBujIXmg-1; Wed, 27 May 2020 18:11:50 -0400
X-MC-Unique: L0nVD412MHaEGKgBujIXmg-1
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id B7489128CEF9D;
	Wed, 27 May 2020 15:11:47 -0700 (PDT)
Date: Wed, 27 May 2020 15:11:46 -0700 (PDT)
Message-Id: <20200527.151146.209703742963070529.davem@davemloft.net>
To: hch@lst.de
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200527182229.517794-1-hch@lst.de>
References: <20200527182229.517794-1-hch@lst.de>
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Wed, 27 May 2020 15:11:48 -0700 (PDT)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: marcelo.leitner@gmail.com, nhorman@tuxdriver.com, netdev@vger.kernel.org,
	vyasevich@gmail.com, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com, kuba@kernel.org
Subject: Re: [Cluster-devel] remove kernel_getsockopt
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

From: Christoph Hellwig <hch@lst.de>
Date: Wed, 27 May 2020 20:22:27 +0200

> this series reduces scope from the last round and just removes
> kernel_getsockopt to avoid conflicting with the sctp cleanup series.

Series applied to net-next, thanks.

