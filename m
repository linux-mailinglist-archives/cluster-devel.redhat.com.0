Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D1285254B14
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 18:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598546770;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZZYnlsbwdEETyA//K1fxkAGL0bwFZ5eVVhPMTOHu8IY=;
	b=hfdc1zYOTaZfEQcN6Efrb0J3yZ+lYex2u6iQ11Hftm5W0iPFpIM7kBjEXJAbTabQDo/wv9
	a6+jt3T93ZBiY/zpzGaK2ZIw50t34cT9QZ3pVPIe4gvMDlKeWstXBWp42ElPtRHs1pfX0R
	56cAOTsKEXjvHpQf+A42oKitjIFskMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-N8SEkXkqP-Wqz00mPKkLIQ-1; Thu, 27 Aug 2020 12:46:09 -0400
X-MC-Unique: N8SEkXkqP-Wqz00mPKkLIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67FED64080;
	Thu, 27 Aug 2020 16:46:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 194715D9E8;
	Thu, 27 Aug 2020 16:46:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FA4718408A1;
	Thu, 27 Aug 2020 16:46:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RGjwkO001693 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 12:45:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 880A41974D; Thu, 27 Aug 2020 16:45:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEABB19936;
	Thu, 27 Aug 2020 16:45:55 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6812668E1;
	Thu, 27 Aug 2020 16:45:55 +0000 (UTC)
Date: Thu, 27 Aug 2020 12:45:55 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <669703327.14508047.1598546755636.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU4yVZwgK7966J+Op=6Y3cCFFPe9uQ16x5u_xZ3zs=fhkg@mail.gmail.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
	<20200821173337.20377-8-rpeterso@redhat.com>
	<CAHc6FU4yVZwgK7966J+Op=6Y3cCFFPe9uQ16x5u_xZ3zs=fhkg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.245, 10.4.195.3]
Thread-Topic: gfs2: make gfs2_ail1_empty_one return the count of active items
Thread-Index: eYMBrhca2NwHOdwIJbMx7l72h8xSwg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 07/12] gfs2: make
 gfs2_ail1_empty_one return the count of active items
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Hi Bob,
> 
> On Fri, Aug 21, 2020 at 7:33 PM Bob Peterson <rpeterso@redhat.com> wrote:
> > This patch is one baby step toward simplifying the journal management.
> > It simply changes function gfs2_ail1_empty_one from a void to an int and
> > makes it return a count of active items. This allows the caller to check
> > the return code rather than list_empty on the tr_ail1_list. This way
> > we can, in a later patch, combine transaction ail1 and ail2 lists.
> 
> what does "we can combine transaction ail1 and ail2 lists" mean?

Hi Andreas,

Well, I've been looking into ways we can simplify the journal logging
code to give us more throughput. One way is to reduce the number of
calls to lock the ail lists. Right now we lock the sd_ail_lock spin_lock
when we add items to the ail1, move them from ail1 to ail2, and for
processing the items on ail2. If we had one combined "ail_list" rather
than two (ail1 and ail2) we wouldn't need to move items from list to list.
We could instead just flag the bufdata elements (somehow--like set_bit
and clear_bit) which could allow us to grab that spin_lock less often,
leading to better throughput. This in turn might lead us to other
simplifications.

Bob Peterson

