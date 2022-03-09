Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B314D31BD
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Mar 2022 16:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646839726;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DoMfPf9NDpO4Z1NOod/HyXwfVBrLOa9yynSJxRxn+k4=;
	b=F7LdspVILLGDnXolyP809aFLVyrT2+lCAZMJUaIaAELv+e1jo4C4zmfcVVhMzXB2vbTJWW
	oDDoCq3ZvKzCsFNlTIYjgQexBnTWxOlmUEJie3HUUqhodcOz2NK7vK+gUiJ8U6SEcxbTWG
	0/uDqSxfdFpSXyM9sydWDOOip7n5/kA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-1Berimh9NJaEaUOlVX2J5Q-1; Wed, 09 Mar 2022 10:28:43 -0500
X-MC-Unique: 1Berimh9NJaEaUOlVX2J5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA635802D32;
	Wed,  9 Mar 2022 15:28:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8098441136E0;
	Wed,  9 Mar 2022 15:28:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55A07195354C;
	Wed,  9 Mar 2022 15:28:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 970E6194F4AE for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 15:17:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 518EE111D78B; Wed,  9 Mar 2022 15:17:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CFC3111D78A
 for <cluster-devel@redhat.com>; Wed,  9 Mar 2022 15:17:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34F21802A67
 for <cluster-devel@redhat.com>; Wed,  9 Mar 2022 15:17:53 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-Xmg4fr44MYWd8bEyteOSRQ-1; Wed, 09 Mar 2022 10:17:51 -0500
X-MC-Unique: Xmg4fr44MYWd8bEyteOSRQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 195-20020a3707cc000000b0067b0c849285so1771497qkh.5
 for <cluster-devel@redhat.com>; Wed, 09 Mar 2022 07:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DoMfPf9NDpO4Z1NOod/HyXwfVBrLOa9yynSJxRxn+k4=;
 b=hGQHDgFmyhCCOBKsKVEpTUbSF/6b7n4I/f3uPhZT62/YpSuY2JZ6qvfM1GcLsR1F2E
 XSY2Ukh4m3cOswXaq2Aon5ujcMupZmGD/z4uhM0vF9di2/BeHWSvJPVCIReAf8QNQaKt
 xqYRo5P24IN2JlMN0Y4VSuQLc/lHil+T4oI1T+Jm/crR/is4fQ6Egg7Gm4AL0Hhl7pT3
 HrcdOV+IT/rjLYyVILWFAYdIplcyCssUSQjrzkWa3t5xzA6/nDS/pUveKRittrpIc8ZQ
 jRicfEq83tlA9XoCq7gdrzVi4kyT7/1xTnXdPVttcBkAiJ40sAVIFE03M8MbDZBm//pC
 4+Yw==
X-Gm-Message-State: AOAM530pbdvrPEUZ41KIuv8VCiKBUMVCO8ElxMceWuzmwUBOC1uqE6yy
 IjkTjgvKxZh8gwcQmpeGxGy1uhTJvrtmXw09iR45m7jXNOLPbEPuRm7cxta4Da/H9KZa3uwqws3
 aMiFKFb7/emb4IkBrwC+gEdpiGgYZ+6V0V7oBVg==
X-Received: by 2002:a05:622a:212:b0:2e1:a335:7ba3 with SMTP id
 b18-20020a05622a021200b002e1a3357ba3mr105975qtx.291.1646839071192; 
 Wed, 09 Mar 2022 07:17:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS39JwTvrVOWwcCe/dMkiIU3wysh8GO+LTnx7/JpL5Ee2Z/O83FLDaemuhkby/0FD7Fu1OhA/LXhhN3XZdTAc=
X-Received: by 2002:a05:622a:212:b0:2e1:a335:7ba3 with SMTP id
 b18-20020a05622a021200b002e1a3357ba3mr105961qtx.291.1646839070965; Wed, 09
 Mar 2022 07:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20220308202119.2673632-1-aahringo@redhat.com>
In-Reply-To: <20220308202119.2673632-1-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 9 Mar 2022 10:17:39 -0500
Message-ID: <CAK-6q+hr-2rOqDc3Hh87Kth4mhnG+fdUVQLe_3xXhrKSccGXJA@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH dlm-tool] dlm_tool: handle dynamic
 length lockspace dump
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
Cc: cluster-devel <cluster-devel@redhat.com>, nwahl@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Mar 8, 2022 at 3:21 PM Alexander Aring <aahringo@redhat.com> wrote:
...
> +++ b/dlm_controld/main.c
> @@ -1070,7 +1070,7 @@ static void query_node_info(int fd, char *name, int nodeid)
>                  (char *)&node, sizeof(node));
>  }
>
> -static void query_lockspaces(int fd, int max)
> +static void query_lockspaces(int fd)
>  {
>         int ls_count = 0;
>         struct dlmc_lockspace *lss = NULL;
> @@ -1083,12 +1083,7 @@ static void query_lockspaces(int fd, int max)
>                 goto out;
>         }
>
> -       if (ls_count > max) {
> -               result = -E2BIG;
> -               ls_count = max;
> -       } else {
> -               result = ls_count;
> -       }
> +       result = ls_count;
>   out:
>         do_reply(fd, DLMC_CMD_LOCKSPACES, NULL, result, 0,
>                  (char *)lss, ls_count * sizeof(struct dlmc_lockspace));
> @@ -1375,7 +1370,7 @@ static void *process_queries(void *arg)
>                         query_node_info(f, h.name, h.data);
>                         break;
>                 case DLMC_CMD_LOCKSPACES:
> -                       query_lockspaces(f, h.data);
> +                       query_lockspaces(f);
>                         break;
>                 case DLMC_CMD_LOCKSPACE_NODES:
>                         query_lockspace_nodes(f, h.name, h.option, h.data);
> diff --git a/dlm_tool/main.c b/dlm_tool/main.c
> index 04ff40f8..f4e69649 100644
> --- a/dlm_tool/main.c
> +++ b/dlm_tool/main.c
> @@ -67,7 +67,6 @@ static int summarize;
>  char run_command[DLMC_RUN_COMMAND_LEN];
>  char run_uuid[DLMC_RUN_UUID_LEN];
>
> -#define MAX_LS 128
>  #define MAX_NODES 128
>
>  /* from linux/fs/dlm/dlm_internal.h */
> @@ -91,7 +90,7 @@ char run_uuid[DLMC_RUN_UUID_LEN];
>  #define DLM_MSG_PURGE           14
>
>
> -struct dlmc_lockspace lss[MAX_LS];
> +struct dlmc_lockspace *lss;

there should be no need anymore to handle this globally, we should be
able to move this pointer into the function. I will fix that as soon
as I apply this patch.

- Alex

