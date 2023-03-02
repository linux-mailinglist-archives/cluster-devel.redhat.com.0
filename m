Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8906A87AC
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Mar 2023 18:15:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677777320;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hhg9NEgdnKUGm8fV0v0TcbMaZqGLlDMeFtZfDeaodso=;
	b=WlMgbKsmP/w4WCjm7faARnCe6g6m+T2RDzN9/VBvfaPUP730D+jlgEPGYY62qv8b3NIvCQ
	/Nx1rkhTIRQVh9vKGHU60L43fRuVl7q/gio3Ex/5u0s2k4BgF068YgXbYORlIj6RWI5SKX
	kpEABT/gwKXI9rffCC8UX5ytpGt7/BU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278--wADKqfxPQmd3Ltiz_W-gQ-1; Thu, 02 Mar 2023 12:15:15 -0500
X-MC-Unique: -wADKqfxPQmd3Ltiz_W-gQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A428F3C0E470;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 981C42166B26;
	Thu,  2 Mar 2023 17:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9CEDB1948668;
	Thu,  2 Mar 2023 17:15:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 21C67194865E for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 17:15:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17555492B00; Thu,  2 Mar 2023 17:14:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E71FB492B16;
 Thu,  2 Mar 2023 17:14:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Mar 2023 12:14:41 -0500
Message-Id: <20230302171441.1509914-14-aahringo@redhat.com>
In-Reply-To: <20230302171441.1509914-1-aahringo@redhat.com>
References: <20230302171441.1509914-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool 14/14] python: add posix lockdb
 plot tool
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds a python tool to plot with use of python plotly [0] the
dlm_controld cluster-wide lockdb. It scans dlm_controld plock log files
for the required information about possible contention (waiters) and the
acquired lock modes over time.

Example:

./lockdb_plot /var/log/dlm_controld/plock.log

and plotly will start a webserver and you can see a generated, interactive
plot about the lockranges in y axis and time in x axis. Depending on
usage it's limited and does not scale. Ther exists arguments like --info
to get plock.log timing information and with --ts_start/ts_end you can
filter a specific time range to only show a small part of the plock log
to reduce the amount of rectangles need to be drawn by the browser.

It shows only lock modes and contention, no lock requests. Means A trylock
is only visible when it was successful. A non trylock will be drawn and
has possible contention.

With this plot it should be easy to figure out on which node a specific
lock range was acquired and resulted in contention.

[0] https://plotly.com/python/
---
 python/tools/lockdb_plot | 429 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 429 insertions(+)
 create mode 100755 python/tools/lockdb_plot

diff --git a/python/tools/lockdb_plot b/python/tools/lockdb_plot
new file mode 100755
index 00000000..761bdea2
--- /dev/null
+++ b/python/tools/lockdb_plot
@@ -0,0 +1,429 @@
+#!/usr/bin/env python3
+
+import plotly.graph_objects as go
+from enum import Enum
+import argparse
+import sys
+
+NSECS_PER_SECS = 1000000000
+
+def nsecs_to_secs(nsecs):
+    return nsecs/NSECS_PER_SECS
+
+def secs_to_nsecs(secs):
+    return secs * NSECS_PER_SECS
+
+# entry point of collecting data
+nodes = dict()
+# will parse log to get our_nodeid
+our_nodeid = None
+# legend groups, tmp set to show legend entry only once
+legend_groups = set()
+
+class EType(Enum):
+    LOCK = 1
+    WAITER = 2
+
+def lookup_lockdb(nodeid, ls, number):
+    if nodeid not in nodes:
+        nodes[nodeid] = dict()
+
+    lockspaces = nodes[nodeid]
+    if ls not in lockspaces:
+        lockspaces[ls] = dict()
+
+    if number not in lockspaces[ls]:
+        lockspaces[ls][number] = LockDb(nodeid, ls, number)
+
+    return lockspaces[ls][number]
+
+def plotly_rect_shape(x0, y0, x1, y1, color, opacity, text, group):
+    # we show it in secs
+    x0 = nsecs_to_secs(x0)
+    x1 = nsecs_to_secs(x1)
+
+    rv = go.Scatter(x=[x0,x0,x1,x1,x0],
+                    y=[y0,y1,y1,y0,y0],
+                    fill="toself",
+                    fillcolor=color,
+                    mode='lines',
+                    name=group,
+                    legendgroup=group,
+                    showlegend=group not in legend_groups,
+                    visible=True,
+                    text=text,
+                    line=dict(color=color,
+                              width=1),
+                    opacity=opacity)
+
+    legend_groups.add(group)
+    return rv
+
+
+class LockDbRect():
+    def __init__(self, **kwargs):
+        self.ls = kwargs["ls"]
+        self.number = kwargs["number"]
+        self.pid = kwargs["pid"]
+        self.nodeid = kwargs["nodeid"]
+        self.owner = kwargs["owner"]
+        self.ts_start = kwargs["ts_start"]
+        self.ts_end = kwargs["ts_end"]
+        # +1 because lock range 1000-1000 will then be 999-1000
+        # exclusive vs inclusive we need to decide how to display
+        # it but we don't set a zero height
+        self.lk_start = kwargs["lk_start"] - 1
+        self.lk_end = kwargs["lk_end"]
+
+    def create_shape(self):
+        return plotly_rect_shape(self.ts_start,
+                                 self.lk_start,
+                                 self.ts_end,
+                                 self.lk_end,
+                                 self.get_color(),
+                                 self.get_opacity(),
+                                 self.get_text(),
+                                 self.get_group())
+
+    def get_duration(self):
+        return self.ts_end - self.ts_start
+
+    def get_range(self):
+        return self.lk_end - self.lk_start
+
+    def __str__(self):
+        return str(self.__dict__)
+
+    def __repr__(self):
+        return str(self)
+
+class LockDbRectWaiter(LockDbRect):
+    def __init__(self, **kwargs):
+        super(LockDbRectWaiter, self).__init__(**kwargs)
+
+    def get_color(self):
+        return "green"
+
+    def get_opacity(self):
+        return 0.2
+
+    def get_text(self):
+        # TODO make it human readable for high numbers?
+        ts_start = nsecs_to_secs(self.ts_start);
+        ts_end = nsecs_to_secs(self.ts_end);
+        dt = nsecs_to_secs(self.get_duration());
+
+        text = "nodeid: {}, pid: {}, owner: {}<br>".format(self.nodeid, self.pid, hex(self.owner)) + \
+               "ts_start: {0:.3f},".format(ts_start) + \
+               "ts_end: {0:.3f},".format(ts_end) + \
+               "dt: {0:.3f}<br>".format(dt) + \
+               "lk_start: {}, lk_end: {}, dy: {}<br>".format(hex(self.lk_start), hex(self.lk_end), hex(self.get_range()))
+
+        return text
+
+    def get_text_pl(self):
+        text = "contention:<br>" + \
+                "start: {0:.3f},".format(nsecs_to_secs(self.ts_start)) + \
+                "end: {0:.3f},".format(nsecs_to_secs(self.ts_end)) + \
+                "dt: {0:.3f}".format(nsecs_to_secs(self.get_duration()))
+
+        return text
+
+    def get_group(self):
+        return "contention"
+
+class LockDbRectPLock(LockDbRect):
+    def __init__(self, **kwargs):
+        super(LockDbRectPLock, self).__init__(**kwargs)
+        self.mode = kwargs["mode"]
+        if self.mode == "WR":
+            self.color = "red"
+            self.group = "write lock"
+        elif self.mode == "RD":
+            self.color = "blue"
+            self.group = "read lock"
+        else:
+            print("{}: received unknown mode".format(self.ts_start))
+            return
+
+        self.waiter = None
+
+    def __str__(self):
+        return str(self.__dict__)
+
+    def __repr__(self):
+        return str(self)
+
+    def has_waiter(self):
+        return self.waiter
+
+    def set_waiter(self, wa):
+        if self.has_waiter():
+            print("{}: has already a waiter set".format(self.ts_start))
+            return
+
+        self.waiter = wa
+
+    def get_waiter(self):
+        return self.waiter
+
+    def get_color(self):
+        return self.color
+
+    def get_opacity(self):
+        return 0.4
+
+    def get_text(self):
+        # TODO make it human readable for high numbers?
+        ts_start = nsecs_to_secs(self.ts_start);
+        ts_end = nsecs_to_secs(self.ts_end);
+        dt = nsecs_to_secs(self.get_duration());
+
+        text = "nodeid: {}, pid: {}, owner: {}<br>".format(self.nodeid, self.pid, hex(self.owner)) + \
+               "ts_start: {0:.3f},".format(ts_start) + \
+               "ts_end: {0:.3f},".format(ts_end) + \
+               "dt: {0:.3f}<br>".format(dt) + \
+               "lk_start: {}, lk_end: {}, dy: {}<br>".format(hex(self.lk_start), hex(self.lk_end), hex(self.get_range()))
+
+        if self.has_waiter():
+            text = text + "<br>{}".format(self.get_waiter().get_text_pl())
+
+        return text;
+
+    def get_group(self):
+        return self.group
+
+class LockDb:
+    def __init__(self, nodeid, ls, number):
+        self.nodeid = nodeid
+        self.ls = ls
+        self.number = number
+        self.__ts = dict()
+        self.plocks = list()
+        self.__last_plock = dict()
+        self.waiters = list()
+        self.__last_waiter = dict()
+        self.__ts_start_min = None
+        self.__ts_end_max = 0
+
+    def event_start(self, vals):
+        self.__ts[vals["ptr"]] = vals
+
+    def __plock(self, vals_start, vals_end):
+        pl = LockDbRectPLock(ls=vals_start["ls"],
+                             number=vals_start["number"],
+                             pid=vals_start["pid"],
+                             nodeid=vals_start["nodeid"],
+                             owner=vals_start["owner"],
+                             ts_start=vals_start["ts"],
+                             ts_end=vals_end["ts"],
+                             lk_start=vals_start["start"],
+                             lk_end=vals_start["end"],
+                             mode=vals_start["mode"])
+        self.plocks.append(pl)
+        self.__last_plock[vals_end["ptr"]] = pl
+
+        try:
+            pl.set_waiter(self.__last_waiter[vals_start["owner"]])
+            del(self.__last_waiter[vals_start["owner"]])
+        except KeyError:
+            pass
+
+    def __waiter(self, vals_start, vals_end):
+        wa = LockDbRectWaiter(ls=vals_start["ls"],
+                              number=vals_start["number"],
+                              pid=vals_start["pid"],
+                              nodeid=vals_start["nodeid"],
+                              owner=vals_start["owner"],
+                              ts_start=vals_start["ts"],
+                              ts_end=vals_end["ts"],
+                              lk_start=vals_start["start"],
+                              lk_end=vals_start["end"])
+        self.waiters.append(wa)
+        self.__last_waiter[vals_start["owner"]] = wa
+
+    def event_end(self, vals):
+        try:
+            vals_start = self.__ts[vals["ptr"]]
+            del(self.__ts[vals["ptr"]])
+        except KeyError:
+            print("{}: cannot find previous start, ignoring".format(vals["ts"]))
+            return
+
+        if not self.__ts_start_min:
+            self.__ts_start_min = vals_start["ts"]
+        else:
+            self.__ts_start_min = min(self.__ts_start_min, vals_start["ts"])
+
+        if not self.__ts_start_min:
+            self.__ts_end_max = vals["ts"]
+        else:
+            self.__ts_end_max = max(self.__ts_end_max, vals["ts"])
+
+        if vals["event"] == EType.LOCK:
+            self.__plock(vals_start, vals)
+        elif vals["event"] == EType.WAITER:
+            self.__waiter(vals_start, vals)
+        else:
+            print("{}: unknown event type".format(vals["ts"]))
+
+    def add_shapes(self, fig):
+        global legend_groups
+        legend_groups = set()
+
+        # first waiters to be in background
+        for wa in self.waiters:
+            fig.add_trace(wa.create_shape())
+
+        # next layer to draw lock states
+        for pl in self.plocks:
+            fig.add_trace(pl.create_shape())
+
+    def get_ts_min(self):
+        return self.__ts_start_min
+
+    def get_ts_max(self):
+        return self.__ts_end_max
+
+    def __str__(self):
+        return "ls {} inode {}".format(self.ls, self.number)
+
+    def __repr__(self):
+        return str(self)
+
+parser = argparse.ArgumentParser(description="Plots dlm_controld lock databases")
+parser.add_argument('-i', "--info", action="store_true")
+parser.add_argument('-s', "--ts_start", type=float)
+parser.add_argument('-e', "--ts_end", type=float)
+
+parser.add_argument('plock_logs', type=argparse.FileType('r'), nargs='+')
+args = parser.parse_args()
+
+for f in args.plock_logs:
+    lines = f.readlines()
+
+    # Current way to figure out our nodeid
+    for line in lines:
+        if "read plock" in line:
+            lsplit = line.split()
+            npo = lsplit[11].split('/')
+            nodeid = int(npo[0])
+            our_nodeid = nodeid
+            break
+
+    if not our_nodeid:
+        print("{}: could not determine our nodeid".format(f))
+        continue
+
+    for line in lines:
+        if "state plock" in line:
+            pass
+        elif "state waiter" in line:
+            pass
+        else:
+            continue
+
+        vals = dict()
+        lsplit = line.split()
+        vals["ts"] = int(lsplit[3])
+
+        if args.ts_start and secs_to_nsecs(args.ts_start) > int(vals["ts"]):
+            continue
+
+        if args.ts_end and secs_to_nsecs(args.ts_end) < int(vals["ts"]):
+            break;
+
+        vals["ls"] = lsplit[4]
+        vals["op"] = lsplit[7]
+        vals["number"] = int(lsplit[8], 16)
+        vals["ptr"] = lsplit[9]
+
+        db = lookup_lockdb(our_nodeid, vals["ls"], vals["number"])
+        if "state plock" in line:
+            vals["event"] = EType.LOCK
+            if vals["op"] == "start":
+                vals["mode"] = lsplit[10]
+                se = lsplit[11].split('-')
+                vals["start"] = int(se[0], 16)
+                vals["end"] = int(se[1], 16)
+                npo = lsplit[12].split('/')
+                vals["nodeid"] = int(npo[0])
+                vals["pid"] = int(npo[1])
+                vals["owner"] = int(npo[2], 16)
+                db.event_start(vals)
+            elif vals["op"] =="end":
+                db.event_end(vals)
+            else:
+                print("{}: unknown state plock operation: {}".format(vals["ts"], vals["op"]))
+        elif "state waiter" in line:
+            vals["event"] = EType.WAITER
+            if vals["op"] == "start":
+                se = lsplit[10].split('-')
+                vals["start"] = int(se[0], 16)
+                vals["end"] = int(se[1], 16)
+                npo = lsplit[11].split('/')
+                vals["nodeid"] = int(npo[0])
+                vals["pid"] = int(npo[1])
+                vals["owner"] = int(npo[2], 16)
+                db.event_start(vals)
+            elif vals["op"] == "end":
+                db.event_end(vals)
+            else:
+                print("{}: unknown state waiter operation: {}".format(vals["ts"], vals["op"]))
+        else:
+            print("received unknown line event: {}".format(line))
+
+if args.info:
+    ts_max = None
+    ts_min = None
+
+    for nodeid in nodes:
+        for ls in nodes[nodeid]:
+            for number in nodes[nodeid][ls]:
+                db = lookup_lockdb(nodeid, ls, number)
+                if not ts_min:
+                    ts_min = db.get_ts_min()
+                else:
+                    ts_min = min(ts_min, db.get_ts_min())
+
+                if not ts_max:
+                    ts_max = db.get_ts_max()
+                else:
+                    ts_max = min(ts_max, db.get_ts_max())
+
+    print("global info:")
+    print("\tts_start: {0:.3f} secs".format(nsecs_to_secs(ts_min)))
+    print("\tts_end: {0:.3f} secs".format(nsecs_to_secs(ts_max)))
+    print("\tduration: {0:.3f} secs".format(nsecs_to_secs(ts_max) - nsecs_to_secs(ts_min)))
+
+    print()
+    print("per inode lock info:")
+    for nodeid in nodes:
+        print("nodeid: {}".format(nodeid))
+        for ls in nodes[nodeid]:
+            print("\tls: {}".format(ls))
+            for number in nodes[nodeid][ls]:
+                print("\t\tinode: {}".format(hex(number)))
+                db = lookup_lockdb(nodeid, ls, number)
+                print("\t\t\tts_start: {0:.3f} secs".format(nsecs_to_secs(db.get_ts_min())))
+                print("\t\t\tts_end: {0:.3f} secs".format(nsecs_to_secs(db.get_ts_max())))
+                print("\t\t\tduration: {0:.3f} secs".format(nsecs_to_secs(db.get_ts_max()) - nsecs_to_secs(db.get_ts_min())))
+
+    exit(0)
+
+for nodeid in nodes:
+    for ls in nodes[nodeid]:
+        for number in nodes[nodeid][ls]:
+            print("create plot: {} {} {}".format(nodeid, ls, number))
+
+            fig = go.Figure()
+            fig.update_layout(title_text="dlm_controld cluster-wide lock database<br>nodeid: {}, lockspace: {}, inode: {}".format(nodeid, ls, hex(number)))
+
+            # fill plot with shapes
+            lookup_lockdb(nodeid, ls, number).add_shapes(fig)
+
+            fig.update_xaxes(title_text='Time (secs)')
+            fig.update_yaxes(title_text='Lock Range (bytes decimal)')
+
+            config = dict({'scrollZoom': True, 'displaylogo': False})
+            fig.show(config=config)
-- 
2.31.1

