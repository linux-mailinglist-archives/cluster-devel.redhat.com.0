Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A42C659D6A7
	for <lists+cluster-devel@lfdr.de>; Tue, 23 Aug 2022 11:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661247467;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QkzKQGB2znNxgGYTqQF+Fbl0fWwxrBy8JEIhMBuRkok=;
	b=S2JDt7CiAXubpduLxbR6TtRidva2A6x13xnuOLyN4Bf5m6kRzMaEdG2M8fitXh/UWU/xjQ
	O7V6VWmzSJZ7fa8ZlYRO6pCNgVvfN2EVdE7cwyI1e1h4Ymk4/wDzT3wG+54J0Z7ckwJAh4
	XVud1rxOQPb2u23TmlWbsp6oiH5rsBo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-VcNLBRRzNCqiWXsiolRypA-1; Tue, 23 Aug 2022 05:37:44 -0400
X-MC-Unique: VcNLBRRzNCqiWXsiolRypA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6672229DD983;
	Tue, 23 Aug 2022 09:37:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2ABEC15BB3;
	Tue, 23 Aug 2022 09:37:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA30F1946A58;
	Tue, 23 Aug 2022 09:37:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 39B541946A40 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 Aug 2022 09:37:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1A67F945D2; Tue, 23 Aug 2022 09:37:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16C42945D0
 for <cluster-devel@redhat.com>; Tue, 23 Aug 2022 09:37:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED42B85A585
 for <cluster-devel@redhat.com>; Tue, 23 Aug 2022 09:37:37 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-_0Xe8qmnOLSr1zkH4dx0wg-1; Tue, 23 Aug 2022 05:37:36 -0400
X-MC-Unique: _0Xe8qmnOLSr1zkH4dx0wg-1
Received: by mail-qt1-f199.google.com with SMTP id
 ci6-20020a05622a260600b0034370b6f5d6so10238021qtb.14
 for <cluster-devel@redhat.com>; Tue, 23 Aug 2022 02:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=QkzKQGB2znNxgGYTqQF+Fbl0fWwxrBy8JEIhMBuRkok=;
 b=yuERl0YKnsKUMj/U2J0zUn3WAJasrTCmdByE5MHD8muHvrP4askzl2euOhhgAsaJ6Y
 Td79PjIDP4Z0lPE8ZI61+FqLOHHXMDfRGDwKGNnN/5+qSJzIJIzg+xwYF8EcxGzrWHvd
 hxUZlhDYqiU4LnOkjE3y3Cm8TiuBm+eaiUP39Iiw9GLOtUDK298D9TsVfVvt+VYC4Cyh
 T4be3xosJaW9BuOmZ0AeNTbijh+gcjLqE9vEkuSVuemrDLs+TRyAf+Mtw7+OEloItrMZ
 c/xVUs4K+rf6TlwlGobXERlUGRf7nRtz2H9A4izNeuZ0she9BYxlaigDjaNtJcAG0O3Q
 HHWQ==
X-Gm-Message-State: ACgBeo23uC/5Z0EfDRoRuI6JiZFKZQEXCgLfyl3bol5ZfK4vrmez9582
 1jD0YlM0pnqf2XFAtS9fuBvW3Oz1sY1Tx9pWf0OJA4hd+dXY4YXdU6knqDBPbgR6KUEcy0b0qLu
 zjMgtPIH4qpNo8y6jSdF37w==
X-Received: by 2002:a05:6214:1941:b0:496:ca94:98aa with SMTP id
 q1-20020a056214194100b00496ca9498aamr13712017qvk.8.1661247456202; 
 Tue, 23 Aug 2022 02:37:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6f95tC2jjoNeeCmUJtYCzXzWGMBXa5cNQ9waXKllvos0EixLez1jcWkYQvBoZtQxwzdqZv4A==
X-Received: by 2002:a05:6214:1941:b0:496:ca94:98aa with SMTP id
 q1-20020a056214194100b00496ca9498aamr13712009qvk.8.1661247456003; 
 Tue, 23 Aug 2022 02:37:36 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a05620a440500b006bb5cdd4031sm8501690qkp.40.2022.08.23.02.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 02:37:35 -0700 (PDT)
Message-ID: <bd7275c6-4ebe-de99-75c2-400cfa2e5026@redhat.com>
Date: Tue, 23 Aug 2022 10:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20220818210144.7915-1-wsa+renesas@sang-engineering.com>
From: Andrew Price <anprice@redhat.com>
In-Reply-To: <20220818210144.7915-1-wsa+renesas@sang-engineering.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH] gfs2: move from strlcpy with unused
 retval to strscpy
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2022 22:01, Wolfram Sang wrote:
> Follow the advice of the below link and prefer 'strscpy' in this
> subsystem. Conversion is 1:1 because the return value is not used.
> Generated by a coccinelle script.
> 
> Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   fs/gfs2/ops_fstype.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 549879929c84..b57d9bf4b123 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -381,8 +381,8 @@ static int init_names(struct gfs2_sbd *sdp, int silent)
>   	if (!table[0])
>   		table = sdp->sd_vfs->s_id;
>   
> -	strlcpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
> -	strlcpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
> +	strscpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
> +	strscpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);

Perhaps the size should be changed to GFS2_LOCKNAME_LEN to match the 
size of the destination, too.

With that addition, this patch fixes this syzkaller report:

https://listman.redhat.com/archives/cluster-devel/2022-August/022755.html

Andy

>   
>   	table = sdp->sd_table_name;
>   	while ((table = strchr(table, '/')))
> @@ -1439,13 +1439,13 @@ static int gfs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
>   
>   	switch (o) {
>   	case Opt_lockproto:
> -		strlcpy(args->ar_lockproto, param->string, GFS2_LOCKNAME_LEN);
> +		strscpy(args->ar_lockproto, param->string, GFS2_LOCKNAME_LEN);
>   		break;
>   	case Opt_locktable:
> -		strlcpy(args->ar_locktable, param->string, GFS2_LOCKNAME_LEN);
> +		strscpy(args->ar_locktable, param->string, GFS2_LOCKNAME_LEN);
>   		break;
>   	case Opt_hostdata:
> -		strlcpy(args->ar_hostdata, param->string, GFS2_LOCKNAME_LEN);
> +		strscpy(args->ar_hostdata, param->string, GFS2_LOCKNAME_LEN);
>   		break;
>   	case Opt_spectator:
>   		args->ar_spectator = 1;

