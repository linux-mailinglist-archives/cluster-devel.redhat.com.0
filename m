Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE21E6785D1
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Jan 2023 20:08:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674500915;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nc5hQLMn/PMA5fu2JCyJNrg+thFjupMP992brik8Ahk=;
	b=IVRjwOLjulr4Sq4qYEipq6FwzdjJ2B3Z2Zp5qB9cb2yXBJ5eHpz/tiQxHtDFpwcIpg/uSw
	/10J4/BxTOIAl37iSNDMk7qclGJdvkjhVphkvGY8SN8eVAicBR6/bn+oQXUa0gh9lBT9Vq
	XDz0fSeELfIvKffuBuh0bO/BU9ykpls=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-yjUskeALMeWLbQZbwhvqRw-1; Mon, 23 Jan 2023 14:08:32 -0500
X-MC-Unique: yjUskeALMeWLbQZbwhvqRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFA8E85C6EA;
	Mon, 23 Jan 2023 19:08:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D346A175A2;
	Mon, 23 Jan 2023 19:08:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7637C1946594;
	Mon, 23 Jan 2023 19:08:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA7781946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 23 Jan 2023 19:08:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9F0DC2166B34; Mon, 23 Jan 2023 19:08:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 986122166B32
 for <cluster-devel@redhat.com>; Mon, 23 Jan 2023 19:08:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EC9188B7B2
 for <cluster-devel@redhat.com>; Mon, 23 Jan 2023 19:08:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-J6rUf6ljPPaHAemu6dgapw-1; Mon, 23 Jan 2023 14:08:27 -0500
X-MC-Unique: J6rUf6ljPPaHAemu6dgapw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 05DE4B80DCC;
 Mon, 23 Jan 2023 18:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2369BC433EF;
 Mon, 23 Jan 2023 18:59:46 +0000 (UTC)
Date: Mon, 23 Jan 2023 10:59:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@lst.de>
Message-Id: <20230123105945.958075d46b0a05ffd545e276@linux-foundation.org>
In-Reply-To: <20230122072006.GA3654@lst.de>
References: <20230121065755.1140136-1-hch@lst.de>
 <20230121170641.121f4224a0e8304765bb4738@linux-foundation.org>
 <20230122072006.GA3654@lst.de>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] return an ERR_PTR from __filemap_get_folio v2
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 22 Jan 2023 08:20:06 +0100 Christoph Hellwig <hch@lst.de> wrote:

> On Sat, Jan 21, 2023 at 05:06:41PM -0800, Andrew Morton wrote:
> > This patchset doesn't apply to fs/btrfs/ because linux-next contains
> > this 6+ month-old commit:
> 
> Hmm.  It was literally written against linux-next as of last morning,
> which does not have that commit.

Confused.  According to 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/btrfs/disk-io.c#n4023

it's there today.  wait_dev_supers() has been foliofied.

