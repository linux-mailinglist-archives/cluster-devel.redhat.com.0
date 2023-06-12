Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5DC72C3FB
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 14:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686572775;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S6ZdyZg6hNdeUU+LQE/L/YOLwn1dgQKDi1YGfrHhXZg=;
	b=YTTdnnZJ3fEIkdBoQGGr+KhKOsc79nb1hVJrPSHtb88onfELu13updOVRd3Ac2KcTS6qSa
	erYc9TufdYQboyQJpS8HIR3rFuZ2OBI35AxQd71hOJuMJRQaYVISrcG8sUCfr12UjkSqlB
	1qQla5gdQ5LwwmD1vAHyLK7UY4NLPbQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-pAXtVZpUNyqFBCSa0qdzsg-1; Mon, 12 Jun 2023 08:26:09 -0400
X-MC-Unique: pAXtVZpUNyqFBCSa0qdzsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5609185A7A9;
	Mon, 12 Jun 2023 12:26:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B371141510A;
	Mon, 12 Jun 2023 12:26:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D0CF219465B9;
	Mon, 12 Jun 2023 12:25:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2AC41194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 12:25:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C13BC20234B3; Mon, 12 Jun 2023 12:25:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 023222026833;
 Mon, 12 Jun 2023 12:25:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202306121557.2d17019b-oliver.sang@intel.com>
References: <202306121557.2d17019b-oliver.sang@intel.com>
To: kernel test robot <oliver.sang@intel.com>
MIME-Version: 1.0
Date: Mon, 12 Jun 2023 13:25:48 +0100
Message-ID: <105869.1686572748@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [linux-next:master] [splice] 2cb1e08985:
 stress-ng.sendfile.ops_per_sec 11.6% improvement
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: jfs-discussion@lists.sourceforge.net, David Hildenbrand <david@redhat.com>,
 feng.tang@intel.com, dhowells@redhat.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-nilfs@vger.kernel.org, lkp@intel.com, Christoph Hellwig <hch@lst.de>,
 cluster-devel@redhat.com, ying.huang@intel.com, linux-ext4@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, ecryptfs@vger.kernel.org,
 linux-um@lists.infradead.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, linux-ntfs-dev@lists.sourceforge.net,
 fengwei.yin@intel.com, ocfs2-devel@oss.oracle.com, oe-lkp@lists.linux.dev,
 ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <105868.1686572748.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> wrote:

> kernel test robot noticed a 11.6% improvement of stress-ng.sendfile.ops_p=
er_sec on:

If it's sending to a socket, this is entirely feasible.  The
splice_to_socket() function now sends multiple pages in one go to the netwo=
rk
protocol's sendmsg() method to process instead of using sendpage to send on=
e
page at a time.

David

