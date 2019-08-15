Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FE48ED22
	for <lists+cluster-devel@lfdr.de>; Thu, 15 Aug 2019 15:42:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD81E302C067;
	Thu, 15 Aug 2019 13:42:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AE3A83886;
	Thu, 15 Aug 2019 13:42:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17E9F24F30;
	Thu, 15 Aug 2019 13:42:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FDfSYP005799 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 09:41:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C90860C5D; Thu, 15 Aug 2019 13:41:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98AE395A42
	for <cluster-devel@redhat.com>; Thu, 15 Aug 2019 13:41:26 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3982518089C8
	for <cluster-devel@redhat.com>; Thu, 15 Aug 2019 13:41:26 +0000 (UTC)
Date: Thu, 15 Aug 2019 09:41:26 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1147324513.8687737.1565876486114.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190815132722.1522-3-rpeterso@redhat.com>
References: <20190815132722.1522-1-rpeterso@redhat.com>
	<20190815132722.1522-3-rpeterso@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.117.77, 10.4.195.3]
Thread-Topic: gfs2: Use async glocks for rename
Thread-Index: quv4DdnFGNw8rtk0FTXA7rjEB4Awsw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH 2/2] gfs2: Use async glocks for
 rename
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 15 Aug 2019 13:42:02 +0000 (UTC)

I just noticed the parameter comments for gfs2_glock_async_wait
are wrong, and I've fixed them in a newer version. I can post
the new version after I get people's initial reactions.

Bob

----- Original Message -----
> Because s_vfs_rename_mutex is not cluster-wide, multiple nodes can
> reverse the roles of which directories are "old" and which are "new"
> for the purposes of rename. This can cause deadlocks where two nodes
> can lock old-then-new but since their roles are reversed, they wait
> for each other.
> 
> This patch fixes the problem by acquiring all gfs2_rename's inode
> glocks asychronously and waits for all glocks to be acquired.
> That way all inodes are locked regardless of the order.
> 
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
(snip)
> + * gfs2_glock_async_wait - wait on multiple asynchronous glock acquisitions
> + * @gh: the glock holder
(snip)
> +int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs)

