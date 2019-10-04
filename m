Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 91079CC182
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Oct 2019 19:20:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70404309DEFC;
	Fri,  4 Oct 2019 17:20:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE53F80276;
	Fri,  4 Oct 2019 17:20:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74D3E1803B4A;
	Fri,  4 Oct 2019 17:20:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x94HKO3V005065 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 4 Oct 2019 13:20:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDA266CE67; Fri,  4 Oct 2019 17:20:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D7DD672D5;
	Fri,  4 Oct 2019 17:20:23 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 492E21808876;
	Fri,  4 Oct 2019 17:20:23 +0000 (UTC)
Date: Fri, 4 Oct 2019 13:20:23 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andrew Price <anprice@redhat.com>
Message-ID: <824921067.4882112.1570209623167.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191003153552.2015-1-anprice@redhat.com>
References: <000000000000afc1b40593f68888@google.com>
	<20191003153552.2015-1-anprice@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.219, 10.4.195.10]
Thread-Topic: gfs2: Fix memory leak when gfs2meta's fs_context is freed
Thread-Index: Ei86TZNaiDR88EYSEPqE/xTVbulYpQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com,
	syzbot+c2fdfd2b783754878fb6@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix memory leak when
	gfs2meta's	fs_context is freed
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 04 Oct 2019 17:20:30 +0000 (UTC)

----- Original Message -----
> gfs2 and gfs2meta share an ->init_fs_context function which allocates an
> args structure stored in fc->fs_private. gfs2 registers a ->free
> function to free this memory when the fs_context is cleaned up, but
> there was not one registered for gfs2meta, causing a leak.
> 
> Register a ->free function for gfs2meta. The existing gfs2_fc_free
> function does what we need.
> 
> Reported-by: syzbot+c2fdfd2b783754878fb6@syzkaller.appspotmail.com
> Signed-off-by: Andrew Price <anprice@redhat.com>
> ---

Thanks. Now pushed to for-next.

Bob Peterson

