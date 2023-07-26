Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 009EA76322E
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 11:31:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690363911;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FFejulcjlZ90a7pBDR+V2EmhEsoaKuzj5D1Dv8tK3KE=;
	b=SjiypbjUu3fmbRdqxN98wXvbiX0fU/JzSC9cIrdegkeVBRSx8OsRElnoCV/XtfLTjLyh+j
	Vemnuo2SCW0axIsOjRp50OL+K8RLxoY3ZaL8P5uh65/TRicA291YBiAoXxVKfaPyF4IpTj
	8aYTiee6ZB54QMqV6tpqitX04w4taUw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-_0mSywKYPpWc0-Xx_OHNcw-1; Wed, 26 Jul 2023 05:31:48 -0400
X-MC-Unique: _0mSywKYPpWc0-Xx_OHNcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBEF586D011;
	Wed, 26 Jul 2023 09:31:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C797CC2C7D3;
	Wed, 26 Jul 2023 09:31:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 94963193F51A;
	Wed, 26 Jul 2023 09:31:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A5BFB1946A69 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 09:31:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 93D31492CAC; Wed, 26 Jul 2023 09:31:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C5FE492B01
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 09:31:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CD7685A58A
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 09:31:45 +0000 (UTC)
Received: from out-24.mta0.migadu.com (out-24.mta0.migadu.com
 [91.218.175.24]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-nvt-ipEHM52ZHITzzmoh-g-1; Wed, 26 Jul 2023 05:31:43 -0400
X-MC-Unique: nvt-ipEHM52ZHITzzmoh-g-1
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-44-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 17:30:53 +0800
Message-Id: <B421DD89-09B5-4488-BEC1-D6F88C6DE75A@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-44-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v2 43/47] mm: shrinker: add a secondary
 array for shrinker_info::{map, nr_deferred}
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
 Linux Memory Management List <linux-mm@kvack.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, cel@kernel.org, x86@kernel.org,
 steven.price@arm.com, cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com,
 Vlastimil Babka <vbabka@suse.cz>, linux-raid@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, netdev <netdev@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>=20
> Currently, we maintain two linear arrays per node per memcg, which are
> shrinker_info::map and shrinker_info::nr_deferred. And we need to resize
> them when the shrinker_nr_max is exceeded, that is, allocate a new array,
> and then copy the old array to the new array, and finally free the old
> array by RCU.
>=20
> For shrinker_info::map, we do set_bit() under the RCU lock, so we may set
> the value into the old map which is about to be freed. This may cause the
> value set to be lost. The current solution is not to copy the old map whe=
n
> resizing, but to set all the corresponding bits in the new map to 1. This
> solves the data loss problem, but bring the overhead of more pointless
> loops while doing memcg slab shrink.
>=20
> For shrinker_info::nr_deferred, we will only modify it under the read loc=
k
> of shrinker_rwsem, so it will not run concurrently with the resizing. But
> after we make memcg slab shrink lockless, there will be the same data los=
s
> problem as shrinker_info::map, and we can't work around it like the map.
>=20
> For such resizable arrays, the most straightforward idea is to change it
> to xarray, like we did for list_lru [1]. We need to do xa_store() in the
> list_lru_add()-->set_shrinker_bit(), but this will cause memory
> allocation, and the list_lru_add() doesn't accept failure. A possible
> solution is to pre-allocate, but the location of pre-allocation is not
> well determined.
>=20
> Therefore, this commit chooses to introduce a secondary array for
> shrinker_info::{map, nr_deferred}, so that we only need to copy this
> secondary array every time the size is resized. Then even if we get the
> old secondary array under the RCU lock, the found map and nr_deferred are
> also true, so no data is lost.
>=20
> [1]. https://lore.kernel.org/all/20220228122126.37293-13-songmuchun@byted=
ance.com/
>=20
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>


