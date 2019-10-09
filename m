Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E74D074E
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Oct 2019 08:37:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7E0A3086E2F;
	Wed,  9 Oct 2019 06:37:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47EDC194B2;
	Wed,  9 Oct 2019 06:37:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FE724E58A;
	Wed,  9 Oct 2019 06:37:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x996ainC015337 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 9 Oct 2019 02:36:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 249E060C4B; Wed,  9 Oct 2019 06:36:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.19] (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 483BD60BF4;
	Wed,  9 Oct 2019 06:36:40 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>
References: <000000000000afc1b40593f68888@google.com>
	<20191003153552.2015-1-anprice@redhat.com>
	<824921067.4882112.1570209623167.JavaMail.zimbra@redhat.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <e6c80348-1bd1-bb02-0089-1ed836821fb8@redhat.com>
Date: Wed, 9 Oct 2019 07:36:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <824921067.4882112.1570209623167.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix memory leak when gfs2meta's
 fs_context is freed
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Wed, 09 Oct 2019 06:37:17 +0000 (UTC)

On 04/10/2019 18:20, Bob Peterson wrote:
> ----- Original Message -----
>> gfs2 and gfs2meta share an ->init_fs_context function which allocates an
>> args structure stored in fc->fs_private. gfs2 registers a ->free
>> function to free this memory when the fs_context is cleaned up, but
>> there was not one registered for gfs2meta, causing a leak.
>>
>> Register a ->free function for gfs2meta. The existing gfs2_fc_free
>> function does what we need.
>>
>> Reported-by: syzbot+c2fdfd2b783754878fb6@syzkaller.appspotmail.com
>> Signed-off-by: Andrew Price <anprice@redhat.com>
>> ---
> 
> Thanks. Now pushed to for-next.

Thanks Bob. Can we get this sent to Linus as a fix during this cycle?

Andy

