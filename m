Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C54FE3A5103
	for <lists+cluster-devel@lfdr.de>; Sat, 12 Jun 2021 23:35:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-gns8fwzQOHiypXDYLZuKOQ-1; Sat, 12 Jun 2021 17:35:25 -0400
X-MC-Unique: gns8fwzQOHiypXDYLZuKOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 753CD9F92B;
	Sat, 12 Jun 2021 21:35:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 323971007623;
	Sat, 12 Jun 2021 21:35:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E105546F59;
	Sat, 12 Jun 2021 21:35:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15CLZJ75008625 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 12 Jun 2021 17:35:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3DDDE2166B4D; Sat, 12 Jun 2021 21:35:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 383D62166B4B
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 21:35:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7793F90DE2C
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 21:35:16 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-246-O7RYGAwQPt-6OIt2JjF-hw-1; Sat, 12 Jun 2021 17:35:14 -0400
X-MC-Unique: O7RYGAwQPt-6OIt2JjF-hw-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lsBHd-007RTu-CV; Sat, 12 Jun 2021 21:35:13 +0000
Date: Sat, 12 Jun 2021 21:35:13 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <YMUokdiLMIpr8ee/@zeniv-ca.linux.org.uk>
References: <20210531170123.243771-1-agruenba@redhat.com>
	<20210531170123.243771-5-agruenba@redhat.com>
	<CAHk-=wiB9gvUsebmiOaRXzYVUxJDUt1SozGtRyxR_MDR=Nv7YQ@mail.gmail.com>
	<CAHc6FU4n_F9sPjP7getGRKLpB-KsZt_qhHctqwY5pJrxGxLr2w@mail.gmail.com>
	<YMOOZsBzg/6SKSzT@zeniv-ca.linux.org.uk>
	<YMUhpI/ZIuxvKCt8@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YMUhpI/ZIuxvKCt8@zeniv-ca.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [Cluster-devel] [RFC 4/9] gfs2: Fix mmap + page fault deadlocks
	(part 1)
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 12, 2021 at 09:05:40PM +0000, Al Viro wrote:

> Is the above an accurate description of the mainline situation there?
> In particular, normal read doesn't seem to bother with locks at all.
> What exactly are those cluster locks for in O_DIRECT read?

BTW, assuming the lack of contention, how costly is dropping/regaining
such cluster lock?

