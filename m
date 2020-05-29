Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4898F1E7D38
	for <lists+cluster-devel@lfdr.de>; Fri, 29 May 2020 14:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590755387;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Sko11A2vbDsWsZP8ynVBqX5mJ30+GpqBEPZZ8LR+cRA=;
	b=NCHIXKjeLiJjChAmy0Zh6WNr5OutE2Qq3L7YpzdzQCatYruB6Eus8wTytu3PMt1WKrb8eB
	BgyNkjBGbsJOFrAGSksDiRnBpyd4RJMbViQPqmBFmxfNf02SJgbylxxHZqWcU4WQW1oeIC
	gWrApdLbWEnVKj3vivVcbdmW8UtKI0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-LLS7gsSEOhGC8L1nB8UOGg-1; Fri, 29 May 2020 08:29:45 -0400
X-MC-Unique: LLS7gsSEOhGC8L1nB8UOGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D6F38BF8FF;
	Fri, 29 May 2020 12:29:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E47DA18B6;
	Fri, 29 May 2020 12:29:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF2C36B5E9;
	Fri, 29 May 2020 12:29:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TCTTN3008785 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 08:29:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A7EC010C6EAF; Fri, 29 May 2020 12:29:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8270B10C6EAE
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 12:29:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6D56101A526
	for <cluster-devel@redhat.com>; Fri, 29 May 2020 12:29:26 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-506-qVKirm7uP86dlmzlu9WeSA-1;
	Fri, 29 May 2020 08:29:23 -0400
X-MC-Unique: qVKirm7uP86dlmzlu9WeSA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id B266C68B02; Fri, 29 May 2020 14:29:21 +0200 (CEST)
Date: Fri, 29 May 2020 14:29:21 +0200
From: "'Christoph Hellwig'" <hch@lst.de>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20200529122921.GA28533@lst.de>
References: <20200529120943.101454-1-hch@lst.de>
	<20200529120943.101454-5-hch@lst.de>
	<d95348e2191046e9986860e3f1023491@AcuMS.aculab.com>
MIME-Version: 1.0
In-Reply-To: <d95348e2191046e9986860e3f1023491@AcuMS.aculab.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Neil Horman <nhorman@tuxdriver.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, 'Christoph Hellwig' <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH 4/4] net: remove kernel_setsockopt
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 12:27:12PM +0000, David Laight wrote:
> From: Christoph Hellwig
> > Sent: 29 May 2020 13:10
> > 
> > No users left.
> 
> There is no point even proposing this until all the changes to remove
> its use have made it at least as far into 'net-next' and probably 'net'.

If you look at net-next, the only two users left are the two removed in
this series.

