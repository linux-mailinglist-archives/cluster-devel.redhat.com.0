Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 859261D32B1
	for <lists+cluster-devel@lfdr.de>; Thu, 14 May 2020 16:24:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589466265;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fGWHZrRoLExAS3mHwk8ufZ/s4MYBxFdJolCaEnLqA8M=;
	b=hRcOXDFtlXrl/+wMIQA6LGCjvwUTtzEZf++tEkM6philHDmrhFWmoiNCmxzY8RSJVOcuhd
	5xHdWgG0qdtGdEQBiThNcurIDK40y/L+VzDWqspzeEQPAGWa1WVzWvBpIXWHMZvSSNdz3y
	3+x+c9zmQ0gOXPVMYoXVernqVA4+ZUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-NwkjBmoFMN2yp0jw1V8HfQ-1; Thu, 14 May 2020 10:24:23 -0400
X-MC-Unique: NwkjBmoFMN2yp0jw1V8HfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86FF919057A0;
	Thu, 14 May 2020 14:24:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 055C41001B07;
	Thu, 14 May 2020 14:24:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6AD61809547;
	Thu, 14 May 2020 14:24:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EEODJY006444 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 10:24:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A4C35D9F1; Thu, 14 May 2020 14:24:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E42045D9CA;
	Thu, 14 May 2020 14:24:04 +0000 (UTC)
Date: Thu, 14 May 2020 09:24:03 -0500
From: David Teigland <teigland@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200514142403.GA1447@redhat.com>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-28-hch@lst.de>
	<20200513180058.GB2491@localhost.localdomain>
	<20200514104040.GA12979@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200514104040.GA12979@lst.de>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	linux-sctp@vger.kernel.org, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] is it ok to always pull in sctp for dlm,
 was: Re: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 12:40:40PM +0200, Christoph Hellwig wrote:
> On Wed, May 13, 2020 at 03:00:58PM -0300, Marcelo Ricardo Leitner wrote:
> > On Wed, May 13, 2020 at 08:26:42AM +0200, Christoph Hellwig wrote:
> > > And call it directly from dlm instead of going through kernel_setsockopt.
> > 
> > The advantage on using kernel_setsockopt here is that sctp module will
> > only be loaded if dlm actually creates a SCTP socket.  With this
> > change, sctp will be loaded on setups that may not be actually using
> > it. It's a quite big module and might expose the system.
> > 
> > I'm okay with the SCTP changes, but I'll defer to DLM folks to whether
> > that's too bad or what for DLM.
> 
> So for ipv6 I could just move the helpers inline as they were trivial
> and avoid that issue.  But some of the sctp stuff really is way too
> big for that, so the only other option would be to use symbol_get.

Let's try symbol_get, having the sctp module always loaded caused problems
last time it happened (almost nobody uses dlm with it.)
Dave 

