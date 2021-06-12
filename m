Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 953DE3A5165
	for <lists+cluster-devel@lfdr.de>; Sun, 13 Jun 2021 01:38:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-xAI-WkJvNVq8_FD0PECuCg-1; Sat, 12 Jun 2021 19:38:32 -0400
X-MC-Unique: xAI-WkJvNVq8_FD0PECuCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93E63107ACF6;
	Sat, 12 Jun 2021 23:38:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 280B65D6B1;
	Sat, 12 Jun 2021 23:38:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79BE818095C2;
	Sat, 12 Jun 2021 23:38:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15CNcPvO021026 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 12 Jun 2021 19:38:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CDE112166B49; Sat, 12 Jun 2021 23:38:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C97962166B4E
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 23:38:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC071101A531
	for <cluster-devel@redhat.com>; Sat, 12 Jun 2021 23:38:22 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
	[142.44.231.140]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-443-aHICReqXP-Knf_whzC96qg-1; Sat, 12 Jun 2021 19:38:21 -0400
X-MC-Unique: aHICReqXP-Knf_whzC96qg-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lsDCj-007TCx-0F; Sat, 12 Jun 2021 23:38:17 +0000
Date: Sat, 12 Jun 2021 23:38:16 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YMVFaPZtg7ijvYe2@zeniv-ca.linux.org.uk>
References: <20210531170123.243771-1-agruenba@redhat.com>
	<20210531170123.243771-6-agruenba@redhat.com>
	<YLUY/7pcFMibDnRn@zeniv-ca.linux.org.uk>
	<YMUjQYtBCIxHvsYV@zeniv-ca.linux.org.uk>
	<CAHk-=whcnziOWqVESWKJ6Y1_sG2S2AOa1vv5yKzUGs5gM7qYpQ@mail.gmail.com>
	<YMUrcUXS5jprfGPF@zeniv-ca.linux.org.uk>
	<CAHk-=wgoBx_GzTQMj_HQGAR+f+7VRJ6JbU9UBfuPHKLfTVMPGQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgoBx_GzTQMj_HQGAR+f+7VRJ6JbU9UBfuPHKLfTVMPGQ@mail.gmail.com>
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
	Matthew Wilcox <willy@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [RFC 5/9] iov_iter: Add
	iov_iter_fault_in_writeable()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 12, 2021 at 04:17:30PM -0700, Linus Torvalds wrote:
> On Sat, Jun 12, 2021 at 2:47 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> >         O_DIRECT case is a PITA - there we use GUP and there's no way
> > to tell GUP that in the current situation we do *NOT* want to hit
> > ->fault()/->page_mkwrite()/etc.  pagefault_disable() won't be even
> > noticed there...
> 
> Well, we could change that.
> 
> And we do have get_user_pages_fast_only() these days.

FWIW, I'm looking through the users of iov_iter_get_pages{,_alloc}()
right now; their semantics feels somewhat wrong.  Will follow up
when I finish looking through that pile...

