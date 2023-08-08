Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6F77369B
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Aug 2023 04:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691461734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b018wDD09q8ybQHeVjJQlHvcOhDGiPGtV/Qkh1+P4Jk=;
	b=BnjI4dzlLZmLvbmsdmHWVw0HWsKigeAtNUm1fzsZXj/8fJS3mprrh8Irql553NkX0qyIvE
	oOjYA51OD7wVbou6uVnF1NGGjpj+rTg3OWhPWuzSBZitjfcOvznYCb9OaG3+R6CxXtsV95
	7SXnVQVmKHdWGKbdus4LFMTq5uz3kgw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-gIp2_zCnOYWUchnVOmlJIA-1; Mon, 07 Aug 2023 22:28:53 -0400
X-MC-Unique: gIp2_zCnOYWUchnVOmlJIA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4AC73810D27;
	Tue,  8 Aug 2023 02:28:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE462403169;
	Tue,  8 Aug 2023 02:28:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5F5F2194658C;
	Tue,  8 Aug 2023 02:28:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A470F1946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  8 Aug 2023 02:28:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8EBB22026D2A; Tue,  8 Aug 2023 02:28:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 871C92026D4B
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 02:28:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C248800303
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 02:28:50 +0000 (UTC)
Received: from out-122.mta1.migadu.com (out-122.mta1.migadu.com
 [95.215.58.122]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-GTBq7iQzMYi_rxuM0J_BNg-1; Mon, 07 Aug 2023 22:28:48 -0400
X-MC-Unique: GTBq7iQzMYi_rxuM0J_BNg-1
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230807110936.21819-20-zhengqi.arch@bytedance.com>
Date: Tue, 8 Aug 2023 10:28:00 +0800
Message-Id: <0C2FEFBD-B866-46C4-B684-1FB9A048B899@linux.dev>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-20-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v4 19/48] rcu: dynamically allocate the
 rcu-kfree shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Linux-MM <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, simon.horman@corigine.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, yujie.liu@intel.com, Vlastimil Babka <vbabka@suse.cz>,
 linux-raid@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 tytso@mit.edu, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 netdev <netdev@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit



> On Aug 7, 2023, at 19:09, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> Use new APIs to dynamically allocate the rcu-kfree shrinker.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>


