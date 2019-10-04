Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCFFCC1BB
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Oct 2019 19:28:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFE4530860C8;
	Fri,  4 Oct 2019 17:28:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6F0F5C1B5;
	Fri,  4 Oct 2019 17:28:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2526A4EE69;
	Fri,  4 Oct 2019 17:28:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x94HOrGI005316 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 4 Oct 2019 13:24:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE7C360600; Fri,  4 Oct 2019 17:24:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7EBD60852
	for <cluster-devel@redhat.com>; Fri,  4 Oct 2019 17:24:51 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FB9A1808876
	for <cluster-devel@redhat.com>; Fri,  4 Oct 2019 17:24:51 +0000 (UTC)
Date: Fri, 4 Oct 2019 13:24:51 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1234014019.4883024.1570209891625.JavaMail.zimbra@redhat.com>
In-Reply-To: <1304110467.4882889.1570209818217.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.219, 10.4.195.7]
Thread-Topic: The linux-gfs2/for-next branch is now rebased to master
Thread-Index: LxzEvQYrCpvT6/Tt43xdBpF4ak0Tjg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] FYI: The linux-gfs2/for-next branch is now rebased
	to master
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 04 Oct 2019 17:28:53 +0000 (UTC)

Hi,

FYI: Since Linus pulled all our gfs2 patches and closed the merge
window, and Andreas is at a conference, I rebased linux-gfs2/for-next
onto Linus's new master.

Regards,

Bob Peterson

