Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A55FEF79
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Oct 2022 15:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665755987;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=k8qQltuyjmygy+O43yanVxeFaxBvrjiQoX3IXlPZtGE=;
	b=cN3NpQRDl+17MP9FJOaJphSxBNoVBK87gA1h2pSRANeLIt+dd1gIwwWlu7ClxUgorpUdMJ
	E/4GT6kOD4jwpWfBPDF4eXv3u4P8TWCtE8WmI2b6TC4rdlNiH5mJDmJDgzBjuLBN3+Sij8
	RpKOylz35EhkxkiJ6fB0VxjmgtFsZik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-qPjnt_VQM4C9udyGC7__jA-1; Fri, 14 Oct 2022 09:59:43 -0400
X-MC-Unique: qPjnt_VQM4C9udyGC7__jA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDD41858F17;
	Fri, 14 Oct 2022 13:59:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF37B4030E0;
	Fri, 14 Oct 2022 13:59:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 61B2A1946594;
	Fri, 14 Oct 2022 13:59:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E6A141946588 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 14 Oct 2022 13:59:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C64B84030E1; Fri, 14 Oct 2022 13:59:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 456D84030DF;
 Fri, 14 Oct 2022 13:59:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220901220138.182896-6-vishal.moola@gmail.com>
References: <20220901220138.182896-6-vishal.moola@gmail.com>
 <20220901220138.182896-1-vishal.moola@gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
MIME-Version: 1.0
Date: Fri, 14 Oct 2022 14:59:34 +0100
Message-ID: <1569540.1665755974@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 05/23] afs: Convert
 afs_writepages_region() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 dhowells@redhat.com, linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1569539.1665755974.1@warthog.procyon.org.uk>

Vishal Moola (Oracle) <vishal.moola@gmail.com> wrote:

> Convert to use folios throughout. This function is in preparation to
> remove find_get_pages_range_tag().
> 
> Also modified this function to write the whole batch one at a time,
> rather than calling for a new set every single write.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Tested-by: David Howells <dhowells@redhat.com>

