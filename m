Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5291D1E8653
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 20:09:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590775786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Re5Y7GYMgF5tXEOvc1Z0y7a6ywWpDP5iMSjUtX5Bfvo=;
	b=cqhX4A9QHfwyUCpTFYxXinO+e2+f0oiDH5OvInTqNhuaekwCw6phE2i+g/sQ6UNxgj3OlX
	tlD8Cvs7GHvji2O0w5edCn1feVfyjsb21w8HxCGHzW+w4KFqrD4nVgMcOwqT2ZLTYTnp/m
	nF/tRC7kOS2L5IMJYTxATjQKOz44Mhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-zZ6bwXA4PRWx87KGAa2qSw-1; Fri, 29 May 2020 14:09:44 -0400
X-MC-Unique: zZ6bwXA4PRWx87KGAa2qSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3655318FF660;
	Fri, 29 May 2020 18:09:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF07219C4F;
	Fri, 29 May 2020 18:09:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A08281809547;
	Fri, 29 May 2020 18:09:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TI9Zws008726 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 14:09:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31083610B0; Fri, 29 May 2020 18:09:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D56E60BE2;
	Fri, 29 May 2020 18:09:27 +0000 (UTC)
Date: Fri, 29 May 2020 13:09:25 -0500
From: David Teigland <teigland@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200529180925.GB25942@redhat.com>
References: <20200529120943.101454-1-hch@lst.de>
	<20200529120943.101454-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200529120943.101454-2-hch@lst.de>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Neil Horman <nhorman@tuxdriver.com>, netdev@vger.kernel.org,
	Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	linux-sctp@vger.kernel.org, David Laight <David.Laight@ACULAB.COM>,
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Cluster-devel] [PATCH 1/4] sctp: add sctp_sock_set_nodelay
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 02:09:40PM +0200, Christoph Hellwig wrote:
> Add a helper to directly set the SCTP_NODELAY sockopt from kernel space
> without going through a fake uaccess.

Ack, they look fine to me, thanks.
Dave

