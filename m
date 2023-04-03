Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8986D45F0
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Apr 2023 15:37:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680529062;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6gdHjhTtPck0qGTomKAmf0E7qtv7o388qCQ7T0E/Nhk=;
	b=chQahANvPrMnY6zms3Acd7+225pMNTw4NKomyVjuDY5p2YW1Mw55POJ4KjdZZZ/UD105DP
	4UmcvC2LQV6+HKJmYUxSrLx4dLr/ghshUkAQdUij/I4+nmWs5pUs0MBDGrSSudzm46nayb
	PKp7jbct6Eb3uEdPcvQVVML4v31TLW4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-XD9l2yDaN_u1r44UfVeaiQ-1; Mon, 03 Apr 2023 09:37:39 -0400
X-MC-Unique: XD9l2yDaN_u1r44UfVeaiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8ECCE800B23;
	Mon,  3 Apr 2023 13:37:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57DC0202701E;
	Mon,  3 Apr 2023 13:37:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1182A1946A42;
	Mon,  3 Apr 2023 13:37:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6575F19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  3 Apr 2023 13:37:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 53666C15BB8; Mon,  3 Apr 2023 13:37:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C1A2C15BA0
 for <cluster-devel@redhat.com>; Mon,  3 Apr 2023 13:37:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F47C85C069
 for <cluster-devel@redhat.com>; Mon,  3 Apr 2023 13:37:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-I-Hr3-1XPT6ok-U9JMNSew-1; Mon, 03 Apr 2023 09:37:32 -0400
X-MC-Unique: I-Hr3-1XPT6ok-U9JMNSew-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E097661AC8;
 Mon,  3 Apr 2023 13:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DAAC433EF;
 Mon,  3 Apr 2023 13:27:12 +0000 (UTC)
Date: Mon, 3 Apr 2023 15:27:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Message-ID: <2023040302-surface-thwarting-037f@gregkh>
References: <20230324201933.329885-2-pchelkin@ispras.ru>
 <20230324202615.330615-1-pchelkin@ispras.ru>
MIME-Version: 1.0
In-Reply-To: <20230324202615.330615-1-pchelkin@ispras.ru>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v2 4.19/5.4/5.10 1/1] gfs2: Always check
 inode size of inline inodes
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, cluster-devel@redhat.com,
 syzbot+7bb81dfa9cda07d9cd9d@syzkaller.appspotmail.com,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 24, 2023 at 11:26:15PM +0300, Fedor Pchelkin wrote:
> From: Andreas Gruenbacher <agruenba@redhat.com>
> 
> commit 70376c7ff31221f1d21db5611d8209e677781d3a upstream.
> 
> Check if the inode size of stuffed (inline) inodes is within the allowed
> range when reading inodes from disk (gfs2_dinode_in()).  This prevents
> us from on-disk corruption.
> 
> The two checks in stuffed_readpage() and gfs2_unstuffer_page() that just
> truncate inline data to the maximum allowed size don't actually make
> sense, and they can be removed now as well.
> 
> Reported-by: syzbot+7bb81dfa9cda07d9cd9d@syzkaller.appspotmail.com
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> [pchelkin@ispras.ru: adjust the inode variable inside gfs2_dinode_in with
> the format used before upstream commit 7db354444ad8 ("gfs2: Cosmetic
> gfs2_dinode_{in,out} cleanup")]
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
> v2: add missed From: tag

Now queued up, thanks.

greg k-h

