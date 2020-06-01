Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD9A1EA732
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Jun 2020 17:42:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591026123;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+TrvmibiRqFb4bGsB3j32PYSqWuHNZIQ0Vj/F07sj6I=;
	b=UHqiB1HHR7B7E8if2YbIDrLo52KIq8NNJFEkBxXP1lU1Lh7gKAOyUiTesVwUiUf4mfoXnb
	THT1qaOev734mwCWMfO8u/v0FZqVJ2jAseurk50+M6Zv2Fkt+LP9/WlHM7QxZGAxmKHhPQ
	sShhoAQykXHPMn6FHeXLZ7SQ3ANwWHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-0VCaVXvwMOSVMIcLt7sknw-1; Mon, 01 Jun 2020 11:41:57 -0400
X-MC-Unique: 0VCaVXvwMOSVMIcLt7sknw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D00CD1085986;
	Mon,  1 Jun 2020 15:41:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69180101E672;
	Mon,  1 Jun 2020 15:41:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADBB8938F2;
	Mon,  1 Jun 2020 15:41:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051FfpoX029805 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 11:41:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B00C78EE8; Mon,  1 Jun 2020 15:41:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56EC678EE3
	for <cluster-devel@redhat.com>; Mon,  1 Jun 2020 15:41:47 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 767101809541
	for <cluster-devel@redhat.com>; Mon,  1 Jun 2020 15:41:47 +0000 (UTC)
Date: Mon, 1 Jun 2020 11:41:47 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1396335307.30872315.1591026107438.JavaMail.zimbra@redhat.com>
In-Reply-To: <1511433445.30871896.1591025874945.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.44, 10.4.195.10]
Thread-Topic: My recent 8-patch set
Thread-Index: k41hdfgs5sy/jq+8VEREmDOVkk5/XQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] My recent 8-patch set
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

The patch I posted recently:

gfs2: add memory barriers to gfs2_glock_remove_revoke

...is not necessary and should be ignored, at least for now.

Regards,

Bob Peterson

