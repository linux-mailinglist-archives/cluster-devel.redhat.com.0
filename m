Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 623B21DC304
	for <lists+cluster-devel@lfdr.de>; Thu, 21 May 2020 01:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590017970;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=usgVE9wGsTmR3Ul4KmzuJXmMmNEoxcCV+K4pKCDDnEw=;
	b=ekFB8V37B6o7Xbr8miP2MagyUKuYMiygKAcH356ieQbw0vuXkvR9A987oh5g+/4SE/mX4X
	Ruw0huNTyyy6ELIrH9Dy9g2y7ckgf0HjzG20N3wGjOzq+4cAXr1UadUHeF37ol+x4hsurH
	CxMz1jPKidVmhdoPpGFUy3S3hELWvMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-MYLGWcZ3NBOxKFS7TAdRDw-1; Wed, 20 May 2020 19:39:28 -0400
X-MC-Unique: MYLGWcZ3NBOxKFS7TAdRDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E6FC1005512;
	Wed, 20 May 2020 23:39:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAA085C1BE;
	Wed, 20 May 2020 23:39:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA4971809543;
	Wed, 20 May 2020 23:39:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KNdLRG011783 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 19:39:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 91F30100332C; Wed, 20 May 2020 23:39:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E05E1003212
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 23:39:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 897388ECB0C
	for <cluster-devel@redhat.com>; Wed, 20 May 2020 23:39:19 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-48-uga8qXYqNgCyG8MkQzcvgg-1; Wed, 20 May 2020 19:39:17 -0400
X-MC-Unique: uga8qXYqNgCyG8MkQzcvgg-1
Received: by mail-qt1-f195.google.com with SMTP id m64so4124415qtd.4;
	Wed, 20 May 2020 16:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=usgVE9wGsTmR3Ul4KmzuJXmMmNEoxcCV+K4pKCDDnEw=;
	b=GoBgvFW1Bf/f3b4Sd7ODwL5UGhpgaQXJu6Ky/3sW3TKfwTgWfL7tb8LW+DUozKresi
	KkoMpZpNyIgmtx7AYwyfma3V/hua2E8+tj8CzYC80UO3NN1z5s0eD3N1KygDplyZogRk
	uqN3UVMowEbLLIJZKj4EO7U/+NUcYHnmxXKtNcOk/lGzKuzgZuqVnGz8+wEao6x5Bc8e
	3wpelxruXJKQb7Ci0CNvccty/oTMy/LK4zyjSyHpS+/BYmZnfIw8UBkzFvkuzZ32iTwE
	0fQoi7sH7qINhkpX0BIEZi4lHrZ+tLBnCJpKzp7h3z7tOzdJZ9Mac18NQmD+3cCsfHGi
	pYOw==
X-Gm-Message-State: AOAM532Yt6aDBjiVN4mnWd9dMYd1jHCkHoSjdUq6TUzp8I3//KhLMS8h
	/77mBcZTzloksq1dYkFy4qs=
X-Google-Smtp-Source: ABdhPJzb0RQavdlFPdZ2esbonBQnAnxuJh+Wdn80ZrxdL0NcIMXKvb5xhinFWySzKcTGVqX7yVkgxA==
X-Received: by 2002:ac8:1af3:: with SMTP id h48mr7625941qtk.371.1590017956516; 
	Wed, 20 May 2020 16:39:16 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.225])
	by smtp.gmail.com with ESMTPSA id
	z10sm3685208qtu.22.2020.05.20.16.39.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 May 2020 16:39:15 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 43E1FC0DAC; Wed, 20 May 2020 20:39:13 -0300 (-03)
Date: Wed, 20 May 2020 20:39:13 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20200520233913.GV2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-32-hch@lst.de>
	<20200520231001.GU2491@localhost.localdomain>
	<20200520.162355.2212209708127373208.davem@davemloft.net>
MIME-Version: 1.0
In-Reply-To: <20200520.162355.2212209708127373208.davem@davemloft.net>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: edumazet@google.com, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, hch@lst.de,
	cluster-devel@redhat.com, kuznet@ms2.inr.ac.ru, kuba@kernel.org,
	drbd-dev@tron.linbit.com, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, nhorman@tuxdriver.com,
	yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
	vyasevich@gmail.com, linux-kernel@vger.kernel.org,
	jmaloy@redhat.com, ying.xue@windriver.com, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 31/33] sctp: add sctp_sock_set_nodelay
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2020 at 04:23:55PM -0700, David Miller wrote:
> From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
> Date: Wed, 20 May 2020 20:10:01 -0300
> 
> > The duplication with sctp_setsockopt_nodelay() is quite silly/bad.
> > Also, why have the 'true' hardcoded? It's what dlm uses, yes, but the
> > API could be a bit more complete than that.
> 
> The APIs are being designed based upon what in-tree users actually
> make use of.  We can expand things later if necessary.

Sometimes expanding things later can be though, thus why the worry.
But ok, I get it. Thanks.

The comment still applies, though. (re the duplication)

